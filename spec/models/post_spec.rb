require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(name: 'Nacho', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina.')
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  it 'should be valid' do
    expect(post).to be_valid
  end

  it 'Title must not be blank' do
    post.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'A' * 300
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    post.comments_counter = 'something'
    expect(post).to_not be_valid
  end

  it 'LikesCounter must be an integer' do
    post.likes_counter = 'other thing'
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be greater than or equal to zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
end
