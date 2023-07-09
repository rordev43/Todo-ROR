class User < ApplicationRecord
  has_many :tasks
  devise :database_authenticatable, :registerable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
