class Comment < ApplicationRecord
  attr_accessor :user_id
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { maximum: 140 }
  
end

