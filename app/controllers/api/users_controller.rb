class Api::UsersController < ApplicationController
    # before_action :set_user, only: [:show, :update, :destroy ]

  # wrap_parameters include: User.attribute_names + ['password']

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render :index 
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  # POST /users
  # POST /users.json
  def create
    # render json: user_params
  
    @user = User.new(user_params)
    

    if @user.save
        #success
        login!(@user)
        render :show
    else
        #failure
        # flash.now[:errors] = @user.errors.full_messagesS
        puts "failed"
        render json: @user
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy!
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :join_date, :bio, :website, :session_token)
    end
end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  # def update
  #   if @user.update(user_params)S
  #     render :show, status: :ok, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
