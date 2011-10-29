class RegistrationController < ApplicationController

  before_filter :authorize, :except => [:register, :index, :create, :noregister, :register_wait_list, :registration_full]
  before_filter :setup, :only => [:index, :register, :invoice, :create, :delete, :register_wait_list ]

   def index
      @title = 'Registration'
      render :action => 'register'
   end

   def register
     @num_registered = Registration.find(:all, :conditions => ["event_id = ?", @main_event.id ]).size
     if @main_event.max_seats > @num_registered
        @title = 'Registration'
        render
     else
        @title = "Registration Is Full #{@main_event.max_seats} vs #{@num_registered}"
        render :action => 'registration_full'
     end
   end

   def registration_full
      @title = 'Registration Is Full'
   end

   def register_wait_list
      @title = 'Waiting List Registration'
      @wait_list = true
      render :action => 'register'
   end

   def noregister
      @title = 'Registration'
   end

   def waiting_list_thanks
     @title = 'Thanks'
   end

   def create
      @registration = Registration.new(params[:registration])
      @wait_list = (params[:wait_list] == 'true')
      if !@user || @user.new_record?
         @user = User.new(params[:user])
         @user.last_visit = Time.now
         if ! @user.save
           flash[:notice] = 'There was an error creating your user account'
           render :action => 'register'
           return
         else
           session[:user_id] = @user.id
         end
       end
       @registration.user_id = @user.id
       @registration.event_id = @main_event.id
       @registration.amount_owed = @main_event.registration_cost
       if @registration.save
          if @wait_list
             flash[:notice] = 'You are on the waiting list!'
             WaitlistNotification.invoice(@user, @registration, @main_event).deliver
             redirect_to :action => 'waiting_list_thanks'
          else
             flash[:notice] = 'Registration created'
             InvoiceNotification.invoice(@user, @registration, @main_event).deliver
             redirect_to :action => 'invoice'
          end
       else
          flash[:notice] = 'There was an error in your registration form'
          render :action => 'register'
       end
   end

   def invoice
      @title = 'Invoice'
   end

   def update
     @user = User.find_by_id(session[:user_id])
     @registration = Registration.find(:first, :conditions => ["user_id = ?", @user.id])
     if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Registration Updated'
     else
       flash[:notice] = 'Update failed'
     end
     redirect_to :action => 'register'
   end

   def delete
     if @registration && !@registration.new_record? && @registration.destroy
        flash[:notice] = 'Registration deleted.'
     else
        redirect_to :controller => 'welcome', :action => 'index' and return
     end
   end

   private

   def setup
     @user = User.find_by_id(session[:user_id])
     @registration ||=
       Registration.setup_new_registration(@user,@main_event,
                                           params[:registration])
   end

end
