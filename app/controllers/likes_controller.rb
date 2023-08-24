class LikesController < ApplicationController
  def create
    post_id = params[:post_id]
    user = Post.find(post_id).author
    like = Like.new(author_id: current_user.id, post_id:)
    if like.save
      flash[:success] = 'Liked'
    else
      flash.now[:error] = "Error: Can't like this post"
    end
    redirect_to user_posts_path(user.id)
  end
end
