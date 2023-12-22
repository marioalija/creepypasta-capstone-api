class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    # CHANGE THIS TO SHOW ONLY COMMENTs under a specific story
    render :index
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  def create
    @comment = Comment.create(
      user_id: current_user.id,
      story_id: params[:story_id],
      body: params[:body],
    )
    if @comment.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(
      body: params[:body] || @story.body,
    )
    if @comment.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
