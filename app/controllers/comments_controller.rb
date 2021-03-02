class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy, :update]

  def index
    if params[:article_id].present?
      searched_comments = Comment.where(article_id: params[:article_id])
      render json: searched_comments.to_json, status: 200
    else
      comments = Comment.all

      if comments.any?
        render json: comments.to_json, status: 200
      else
        render json: { alert: "There are no comments yet create a new one now or seed the database" }, status: 200
      end
    end
  end

  def show
    render json: @comment.to_json, status: 200
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment.to_json, status: 201
    else
      render json: { errors: comment.errors.to_json }, status: 400
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
