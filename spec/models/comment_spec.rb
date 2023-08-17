require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(name: 'Nacho', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Argentina.')
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  let(:comment) do
    Comment.new(author: user, post: post, text: 'Awesome!')
  end

  it 'should be valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'belongs to the user' do
    expect(comment.author).to eq(user)
  end

  it 'belongs to the post' do
    expect(comment.post).to eq(post)
  end

  it 'updates post comments counter after save' do
    expect { comment.save }.to change { post.reload.comments_counter }.by(1)
  end
end