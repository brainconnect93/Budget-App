class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 250 }

  def total_expenses
    expenses.sum(:amount)
  end
end
