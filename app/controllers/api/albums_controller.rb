class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :update, :destroy]
  
    # GET /api/albums/:id
    def show
      render json: @album
    end
  
    # POST /api/albums
    def create
      @album = Album.new(album_params)
      if @album.save
        render json: @album, status: :created
      else
        render json: @album.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/albums/:id
    def update
      if @album.update(album_params)
        render json: @album
      else
        render json: @album.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/albums/:id
    def destroy
      @album.destroy
      head :no_content
    end
  
    private
  
    def set_album
      @album = Album.find(params[:id])
    end
  
    def album_params
      params.require(:album).permit(:UserID, :Title, :Description, :CreationDate)
    end
  end
  