class Api::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    posts = user.posts

    render json: posts, status: :ok
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    render json: @post, status: :ok
  end
end
