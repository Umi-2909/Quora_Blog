class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  def total_post
    count = 0
    posts = Post.where(user_id: id)
    count = posts.count
    return count
  end
end
