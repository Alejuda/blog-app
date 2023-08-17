require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(name: 'nacho', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina.')
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  let(:like) do
    Like.new(user: user, post: post)
  end

  it 'should be valid with valid attributes' do
    expect(like).to be_valid
  end

  it 'belongs to the author' do
    expect(like.user).to eq(user)
  end

  it 'belongs to the post' do
    expect(like.post).to eq(post)
  end

  it 'updates post likes counter after save' do
    expect { like.save }.to change { post.reload.likes_counter }.by(1)
  end
end