class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  def recent_comments
    comments.order(created_at: :desc).limit(2)
  end
end
