class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @comments = Comment.where(post_id: params[:post_id])

    render json: @comments, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = @user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
