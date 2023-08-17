require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(name: 'Nacho', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina.')
  end

  it 'Name must not be blank' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'PostsCounter must be an integer' do
    user.posts_counter = 'not-numeric'
    expect(user).to_not be_valid
  end

  it 'PostsCounter must be greater than or equal to 0' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'recent posts should return the last three posts' do
    expect(user.recent_posts).to eq(user.posts.last(3))
  end
end