class AdminController < ApplicationController

   before_filter :authorize_admin

   def index
     @title = 'Adminstration'
   end

   # GET /admin/list_registration
   # GET /admin/list_registration.csv
   def list_registration
      @title = 'Admin - List Registered'
      @registrations = Registration.find(:all, :conditions => ["event_id = ?",@main_event.id], :order => "last_name")
    respond_to do |format|
       format.html # list_registration.html.erb
       format.xml  { render :xml => @registrations, :layout => false }
       format.csv  { render :csv => @registrations, :layout => false }
     end
   end


   def list_events
     @title = 'Admin - List Events'
   end

   def list_age_ranges
      @title = 'Admin - List Age Ranges'
   end

   def list_users
     @users = User.all(:order => :email)
     @title = 'Admin - Users'
   end

   def new_registration
     if params[:user_email].blank?
       @user = User.new
     else
       @user = User.find_by_email(params[:user_email])
     end
     @registration = @user ? Registration.setup_new_registration(@user,@main_event) : Registration.new
     render 'edit_registration'
   end

   def show_registration
      @registration = Registration.find(params[:id])
   end

   def edit_registration
     @registration = Registration.find(params[:id])
     @user = User.find(@registration.user_id)
   end

   def create_registration
     if params[:user_id].blank?
       @user = User.new(params[:user])
       @user.password = User.generate_password
       @user.last_visit = Time.now
       @user.save!
     else
       @user = User.find(params[:user_id])
     end
     @registration = Registration.new(params[:registration])
     @registration.user_id = @user.id
     @registration.event_id = @main_event.id
     if @registration.save
       flash[:notice] = "#{@registration.first_name} #{@registration.last_name} registration created"
       redirect_to :action => 'list_registration' and return
     else
       flash[:notice] = "Registration failed"
       render 'edit_registration'
     end
   end

   def update_registration
     @registration = Registration.find(params[:id])
     if @registration && @registration.update_attributes(params[:registration])
       flash[:notice] = "#{@registration.first_name} #{@registration.last_name} registration updated"
       redirect_to :action => 'list_registration' and return
     else
       flash[:notice] = 'Update failed'
       render 'edit_registration'
     end
   end

   def destroy_registration
      Registration.destroy(params[:id])
      flash[:notice] = 'One registration was deleted'
      redirect_to :action => 'list_registration' and return
   end

   def mark_paid
     r = Registration.find(params[:id])
     if r && r.amount_owed > 0
       r.amount_paid = r.amount_owed
       r.amount_owed = 0
       r.save
       flash[:notice] = "#{r.first_name} #{r.last_name} marked as paid"
     else
       flash[:notice] = "Nothing to do."
     end
     redirect_to :action => 'list_registration' and return
   end

   def edit_faqs
      @faqs = Faq.find(:all, :order => 'list_order')
   end

   def preview_faqs
   end

   def update_faqs
   end

end
