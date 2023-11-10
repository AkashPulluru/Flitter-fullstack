class Api::SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  def show
    if current_user
      render json: { user: current_user.as_json(only: [:id, :email]) }
    else
      render json: { user: nil }
    end
  end

  def create
    @user = User.find_by_credentials(params[:email], params[:password])

    if @user
      login!(@user)
      render json: { user: @user.as_json(only: [:id, :email]) }
    else
      render json: { errors: ['The provided credentials were invalid.'] }, status: :unauthorized
    end
  end

  def destroy
    logout!() if current_user
    render json: { message: 'success' }
  end
end
