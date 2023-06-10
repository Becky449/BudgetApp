require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create(name: 'Tim', email: 'tim@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create(name: 'Shopping', icon: 'shopping-bag.png', author_id: @user.id)
  end

  it 'should be valid' do
    expect(@category).to be_valid
  end

  it 'should have an author id' do
    @category.author_id = nil
    expect(@category).to_not be_valid
  end

  it 'should have an icon present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'should have a category name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end
end
