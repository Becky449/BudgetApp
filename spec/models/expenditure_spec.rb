require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  before :each do
    @user = User.create(name: 'Timmy', email: 'timmy@gmail.com', password: '123456', password_confirmation: '123456')
    @expenditure = Expenditure.create(name: 'Swimming', amount: 43, author_id: @user.id)
    @category = Category.create(name: 'Travel', icon: 'shopping-bag.png', author_id: @user.id)
    @category_expenditure = CategoryExpenditure.new(category_id: @category.id, expenditure_id: @expenditure.id)
  end

  it 'checks if expenditure creation is valid' do
    expect(@expenditure).to be_valid
  end

  it 'checks if name is present' do
    @expenditure.name = nil
    expect(@expenditure).to_not be_valid
  end

  it 'checks if amount is present' do
    @expenditure.amount = nil
    expect(@expenditure).to_not be_valid
  end

  it 'checks if amount is not a string' do
    @expenditure.amount = 'bad'
    expect(@expenditure).to be_valid
  end

  it 'checks if author id is present' do
    @expenditure.author_id = nil
    expect(@expenditure).to_not be_valid
  end
end
