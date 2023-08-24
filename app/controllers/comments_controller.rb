class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post, user: @user} }
    end
  end
end
