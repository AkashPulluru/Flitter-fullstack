class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:email], params[:password])
        if @user
          session[:session_token] = @user.reset_session_token!
          # Redirect to user's homepage or dashboard
        else
          # Render login page with error message
        end
      end
    
      def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
        # Redirect to login page or home page
      end
    
      private
    
      def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
      end
end
