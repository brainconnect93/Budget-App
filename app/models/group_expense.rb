class GroupExpense < ApplicationRecord
    belongs_to :groups, class_name: 'Group'
    belongs_to :expenses, class_name: 'Expense'
  end