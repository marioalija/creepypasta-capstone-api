class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image: params[:image],
      story_id: params[:story_id],
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      password: params[:password] || @user.password,
      image: params[:image] || @user.image,
      story_id: params[:story_id] || @user.story_id,
    )
    if @user.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User destroyed successfully" }
  end
end
