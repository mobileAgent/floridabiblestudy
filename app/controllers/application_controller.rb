# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  # Email exceptions in production environment
  include ExceptionNotifiable

  # Get the event we are working on
  before_filter :get_event

  protected

  def get_event
     @main_event = Event.all(:order => 'start_date').last
  end

  def authorize
     if !session[:user_id] || !User.find_by_id(session[:user_id])
       session[:original_uri] = request.request_uri
       flash[:notice] = "Please log in"
       redirect_to(:controller => "login", :action => "login")
     end
  end

  def authorize_admin
     session[:original_uri] = request.request_uri
     if session[:user_id]
        user = User.find_by_id(session[:user_id])
        unless user && user.admin?
           redirect_to(:controller => "login", :action => "login")
        end
     else
        redirect_to(:controller => "login", :action => "login")
     end
  end

  def admin?
     if session[:user_id]
        user = User.find_by_id(session[:user_id])
        return user && user.admin?
     end
     return false
  end
        

end
