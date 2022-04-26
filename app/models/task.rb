class Task < ApplicationRecord
  after_validation :limit_cannot_be_in_the_past
  belongs_to :user
  enum importance: { 低: 0, 中: 1, 高: 2 }
  validates :title, presence: true, length: {maximum: 100}
  validates :importance, presence: true

  private

  def limit_cannot_be_in_the_past
    if self.limit.present? && self.limit < Date.today
      errors.add(:limit, "can not specify your future date as your birth date.")
    end
  end
end
