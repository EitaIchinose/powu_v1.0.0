class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
