require 'rails_helper'

RSpec.describe 'posts/show', type: :system do
  describe 'show page' do
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

    let!(:comment2) do
      Comment.create(author: commenter, post:, text: 'second comment')
    end
    let!(:comment3) do
      Comment.create(author: commenter, post:, text: 'third comment')
    end

    before do
      visit user_post_path(user, post)
    end

    it 'displays the username of the selected user and the post title' do
      expect(page).to have_selector('h3', text: 'Post Title by nacho')
    end

    it 'displays the number of comments and likes' do
      expect(page).to have_selector('p', text: 'Comments: 3, Likes: 0')
    end

    it 'displays the post body' do
      expect(page).to have_selector('p', text: 'Post Text')
    end

    it 'displays the username of each commentor and the text of his comment' do
      expect(page).to have_selector('p', text: '- commenter: Great post!')
      expect(page).to have_selector('p', text: '- commenter: second comment')
      expect(page).to have_selector('p', text: '- commenter: third comment')
    end
  end
end
