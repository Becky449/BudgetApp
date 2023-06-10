require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Mark', email: 'mark@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'checks if user is valid' do
    expect(@user).to be_valid
  end

  it 'checks if name is present' do
    @user.name = 'Mark'
    expect(@user).to be_valid
  end

  it 'checks if email is present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'checks if password is present' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
