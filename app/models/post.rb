class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true
  validate :correct_image_file_type
  scope :with_title, ->(title){ where("title LIKE ?", "#{title}%")}

  def capitalized_title
    title.capitalize
  end

  def self.titles
    Post.all.pluck(:title)
  end 

  private

  def correct_image_file_type
    if image.attached? && ['image/png', 'image/jpg', 'image/jpeg'].exclude?(image.content_type)
      errors.add(:image, 'Must be jpg or png file')
    end
  end

end
