class LoginController < ApplicationController

  before_filter :authorize, :except => [:login, :forgotten_password, :reset_password]

  def index
     redirect_to :action => 'login'
  end

  def login
    @title = 'Login'
    session[:user_id] = nil
    if request.post?
       user = User.authenticate(params[:email], params[:password])
       if user
          uri = session[:original_uri]
          #request.reset_session    # create a new session to stop fixation
          #session = request.session # overwrite the current session
          session[:original_uri] = nil
          session[:user_id] = user.id
          if user.admin?
             flash[:notice] = "Kenichiwa, #{user.email}! (Adminstrator)"
             redirect_to(uri || {:controller => "admin" , :action => "list_registration"}) and return
          else
             flash[:notice] = "Hi, #{user.email}!"
             redirect_to(uri || {:controller => "registration" , :action => "register"}) and return
           end
       else
          flash[:notice] = "The information you provided does not match our records"
       end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => "welcome", :action => "index" and return
  end

  def forgotten_password
     @title = 'Forgotten Password'
  end

  def reset_password
     if request.post?
        user = User.find_by_email(params[:email])
        if user
           new_password = User.generate_password()
           user.password=new_password
           user.save
           PasswordNotification.password(user, new_password).deliver
           flash[:notice] = "New password has been mailed to #{params[:email]}."
        else
           flash[:notice] = "The information you provided does not match our records"
        end
     end
     redirect_to :controller => 'login', :action => 'login' and return
  end

end
