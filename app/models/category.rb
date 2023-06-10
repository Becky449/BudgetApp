class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenditures, dependent: :destroy, foreign_key: 'category_id'
  has_many :expenditures, through: :category_expenditures, foreign_key: 'category_id', dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def total
    expenditures.sum(:amount)
  end
end
