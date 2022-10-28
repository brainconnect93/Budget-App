class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
