class CategoryTransaction < ApplicationRecord
  belongs_to :category

  has_one_attached :image

  scope :by_category, ->(category) { where(category:) }

  validate :image_type
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :payment, presence: true, numericality: { greater_than: 0 }

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
