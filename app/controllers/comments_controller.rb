class CommentsController < ApplicationController
  def new
    @user = current_user
    @post_id = params[:post_id]
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post, user: @user} }
    end
  end

  def create
    comment_params = params.require(:comment).permit(:text, :post_id)
    comment = Comment.new(author_id: current_user.id, **comment_params)
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = "Comment created successfully"
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = "Error: Post have not been saved"
          render :new, locals: {user: current_user}
        end
      end
    end
  end
end
