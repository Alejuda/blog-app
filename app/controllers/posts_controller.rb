class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    post = Post.new(post_params)
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'Error: Post have not been saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Error deleting the post'
    end
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
