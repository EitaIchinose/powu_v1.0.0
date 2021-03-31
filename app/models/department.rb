class Department < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
end
