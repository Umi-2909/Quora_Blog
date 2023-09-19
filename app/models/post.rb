class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 500 }
  validates :body, presence: true, length: { minimum: 10, maximum: 10_000 }
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
