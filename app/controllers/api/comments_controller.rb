class Api::CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

        # GET /api/comments
        def index
            @comments = Comment.all
            render json: @comments
          end
      
          # POST /api/comments
          def create
            @comment = Comment.new(comment_params)
      
            if @comment.save
              render json: @comment, status: :created
            else
              render json: @comment.errors, status: :unprocessable_entity
            end
          end
      
          # GET /api/comments/:id
          def show
            render json: @comment
          end
      
          # PATCH/PUT /api/comments/:id
          def update
            if @comment.update(comment_params)
              render json: @comment
            else
              render json: @comment.errors, status: :unprocessable_entity
            end
          end
      
          # DELETE /api/comments/:id
          def destroy
            @comment.destroy
          end
      
          private
            def set_comment
              @comment = Comment.find(params[:id])
            end
      
            def comment_params
              params.require(:comment).permit(:photo_id, :user_id, :comment_text, :comment_date)
            end
        end
end
