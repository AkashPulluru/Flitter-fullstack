class Api::PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :update, :destroy]
    wrap_parameters include: Photo.attribute_names + [:photo], format: :multipart_form
    # GET /api/photos/:id
    def show
      @photo = Photo.find(params[:id])
      # debugger 
      render :show
    end
    
    def index
      debugger
      if params[:user_id]
        @photos = Photo.where(user_id: params[:user_id])
      else
        @photos = Photo.all
      end
      render :index
    end
    
  
    # POST /api/photos
    def create
      @photo = Photo.new(photo_params)
      if @photo.save
        render json: @photo, status: :created
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/photos/:id
    def update
      if @photo.update(photo_params)
        render json: @photo
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/photos/:id
    def destroy
      @photo.destroy
      head :no_content
    end
  
    private
  
    def set_photo
      @photo = Photo.find(params[:id])
    end
  
    def photo_params
      params.require(:photo).permit(:user_id, :title, :description,  :url)
    end
  end
  