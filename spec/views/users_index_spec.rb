require 'rails_helper'

RSpec.describe 'users/index', type: :system do
  describe 'index page' do
    let!(:user1) do
      User.create(name: 'nacho', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from argentina', posts_counter: 0)
    end
    let!(:user2) do
      User.create(name: 'gabriel', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from chile', posts_counter: 1)
    end

    before do
      visit users_path
    end

    it 'displays the username of all users' do
      expect(page).to have_selector('h2', text: 'nacho')
      expect(page).to have_selector('h2', text: 'gabriel')
    end

    it 'displays the profile picture for each user' do
      expect(page).to have_selector('img[alt="Profile photo"]', count: 2)
    end

    it 'displays the number of posts each user has written' do
      expect(page).to have_selector('h4', text: 'Number of posts: 0')
      expect(page).to have_selector('h4', text: 'Number of posts: 1')
    end

    it 'redirects to the user show page' do
      visit users_path
      click_link user1.name

      expect(page).to have_current_path(user_path(user1))
    end
  end
end
