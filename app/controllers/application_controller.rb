class ApplicationController < ActionController::API
    helper_method :current_user, :logged_in?

    private
  
    def current_user
      return nil unless session[:session_token]
      @current_user ||= User.find_by(session_token: session[:session_token])
    end
  
    def logged_in?
      !!current_user
    end
    
end
