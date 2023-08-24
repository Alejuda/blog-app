class LikesController < ApplicationController
  def create
    post_id = params[:post_id]
    user = Post.find(post_id).author
    like = Like.new(author_id: current_user.id, post_id: post_id)
    puts like.attributes
    if like.save
      flash[:success] = "Liked"
      puts "liked"
      redirect_to user_posts_path(user.id)
    else
      flash.now[:error] = "Error: Can't like this post"
      redirect_to user_posts_path(user.id)
    end
  end
end

