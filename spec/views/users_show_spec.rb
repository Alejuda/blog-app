require 'rails_helper'

RSpec.describe 'users/show', type: :system do
  describe 'show page' do
    let!(:user) do
      User.create(name: 'nacho', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1', bio: 'teacher from argentina',
                  posts_counter: 3)
    end
    let!(:post) do
      Post.create(title: 'test1', text: 'first post', author: user)
    end
    let!(:post2) do
      Post.create(title: 'test2', text: 'second post', author: user)
    end
    let!(:post3) do
      Post.create(title: 'test3', text: 'third post', author: user)
    end

    before do
      visit user_path(user)
    end

    it 'displays the username' do
      expect(page).to have_selector('h2', text: 'nacho')
    end

    it 'displays the profile photo' do
      expect(page).to have_selector('img[alt="Profile photo"]', count: 1)
    end

    it 'displays the number of posts' do
      expect(page).to have_selector('h4', text: 'Number of posts: 3')
    end

    it 'displays the bio' do
      expect(page).to have_selector('p', text: 'teacher from argentina')
    end

    it 'displays the 3 first posts of the user' do
      expect(page).to have_selector('h3', text: 'Post: test1')
      expect(page).to have_selector('h3', text: 'Post: test2')
      expect(page).to have_selector('h3', text: 'Post: test3')
    end

    it 'displays the button to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'redirects to the post show page when a user post is clicked' do
      click_link('See post >', match: :first)

      expect(page).to have_current_path(user_post_path(user, post3))
    end

    it 'redirects to the post index page when see all post link is clicked' do
      click_link('See all posts')

      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end