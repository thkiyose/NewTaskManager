class Task < ApplicationRecord
  belongs_to :user
  enum importance: { 低: 0, 中: 1, 高: 2 }
  validates :title, presence: true, length: {maximum: 100}
  validates :importance, presence: true
end
