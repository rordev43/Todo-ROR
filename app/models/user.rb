class User < ApplicationRecord
  has_many :tasks
  devise :database_authenticatable, :registerable, :validatable

  validates :email, presence: true, uniqueness: true
end
