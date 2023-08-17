require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(name: 'Nacho', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina.')
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'title should be present' do
    post.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than or equal to 250 characters' do
    subject.title = 'A' * 300
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    post.comments_counter = 'something'
    expect(post).to_not be_valid
  end

  it 'likes counter should be an integer' do
    post.likes_counter = 'other thing'
    expect(post).to_not be_valid
  end

  it 'comments should be greater than or equal to 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'likes should be greater than or equal to 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
end