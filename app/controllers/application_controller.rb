class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	
  # def get_current_user_name 
		# return session[:github_current_user]['login'] if session[:github_current_user]['name'].blank? 
  #   session[:github_current_user]['name']
  # end
  helper_method :current_user
  # helper_method :get_current_user_name
  
end
