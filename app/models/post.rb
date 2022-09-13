class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true
  scope :with_title, ->(title){ where("title LIKE ?", "#{title}%")}
end