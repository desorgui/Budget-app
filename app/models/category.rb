class Category < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  # has_many :user_trasactions, dependent: :destroy

  scope :by_user, ->(user) { where(user:) }

  validate :image_type
  validates :title , presence: true, length: { minimum: 3, maximum: 50 }

  private

  def image_type
    return unless image.attached?

    image_types = %w[
      image/png image/jpeg image/jpg image/webp
    ]

    return if image.content_type.in?(image_types)

    errors.add(:image,
               'Error: Please upload an image with one of the following extensions: jpeg, jpg, png, or webp!')
  end
end
