class Expenditure < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenditures, foreign_key: 'expenditure_id', dependent: :destroy
  has_many :categories, through: :category_expenditures, foreign_key: 'expenditure_id'

  validates :name, presence: true
  validates :amount, presence: true
end
