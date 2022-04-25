class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 10}
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
end
