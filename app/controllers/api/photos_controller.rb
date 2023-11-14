class Api::PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :update, :destroy]
  
    # GET /api/photos/:id
    def show
      render json: @photo
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
      params.require(:photo).permit(:UserID, :Title, :Description, :UploadDate, :URL)
    end
  end
  