require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }

  describe "GET /users/:id/posts" do
    it "renders the index template and includes placeholder text" do
      get user_posts_path(user)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('<ul class="posts-container">')
    end
  end

  describe "GET /users/:id/posts/:post_id" do
    it "renders the show template and includes placeholder text" do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<p class="post-text">')
    end
  end
end