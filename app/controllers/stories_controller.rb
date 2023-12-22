class StoriesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @stories = Story.all
    render :index
  end

  def create
    @story = Story.create(
      user_id: params[:user_id],
      name: params[:name],
      image: params[:image],
      description: params[:description],
      category: params[:category],
    )
    if @story.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @story = Story.find_by(id: params[:id])
    render :show
  end

  def update
    @story = Story.find_by(id: params[:id])
    @story.update(
      user_id: params[:user_id] || @story.user_id,
      name: params[:name] || @story.name,
      image: params[:image] || @story.image,
      description: params[:description] || @story.description,
      category: params[:category] || @story.category,
    )
    if @story.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @story.destroy
    render json: { message: "Story destroyed successfully!" }
  end
end
