class Task < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  scope :search_by_description, ->(query) { where("description LIKE ?", "%#{query}%") }
end
