class SessionsController < ApplicationController

    before_action :require_logged_in

    def require_logged_in
        redirect_to new_session_url unless current_user
    end

    def create
        @user = User.find_by_credentials(params[:email], params[:password])
        if @user
          session[:session_token] = @user.reset_session_token!
        else
        end
      end
    
      def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
      end
    
      private
    
      def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
      end
end
