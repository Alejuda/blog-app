require 'rails_helper'

RSpec.describe 'posts/index', type: :system do
  describe 'index page' do
    let!(:user) do
      User.create(name: 'nacho', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from argentina', posts_counter: 5)
    end

    let!(:commenter) do
      User.create(name: 'commenter', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from mexico', posts_counter: 0)
    end

    let!(:post) do
      Post.create(title: 'Post Title', text: 'Post Text', author: user)
    end

    let!(:comment1) do
      Comment.create(author: commenter, post:, text: 'Great post!')
    end

    before do
      visit user_posts_path(user)
    end

    it 'displays the username of the user' do
      expect(page).to have_selector('h2', text: 'nacho')
    end

    it 'displays the profile photo of the user' do
      expect(page).to have_selector('img[alt="Profile photo"]', count: 1)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_selector('h4', text: 'Number of posts: 1')
    end

    it 'displays the post title' do
      expect(page).to have_selector('h3', text: 'Post: Post Title')
    end

    it 'displays some of the post\'s body' do
      expect(page).to have_selector('p', text: 'Post Text')
    end

    it 'displays some of the post\'s comments' do
      expect(page).to have_selector('p', text: '- commenter: Great post!')
    end

    it 'displays how many comments and likes a post has' do
      expect(page).to have_selector('p', text: 'Comments: 1, Likes: 0')
    end

    it 'displays a section for pagination' do
      expect(page).to have_selector('a', text: 'Pagination')
    end

    it 'redirects me to that post\'s show page when click on a post' do
      click_link 'See post >'
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end
end
