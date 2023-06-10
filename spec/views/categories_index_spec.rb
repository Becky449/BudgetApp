require 'rails_helper'

RSpec.describe 'Category Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Luca', email: 'luca@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create(name: 'Traveling', icon: 'shopping-bag.png', author_id: @user.id)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      visit categories_path
    end

    it 'returns the correct category on the page' do
      expect(page).to have_content('Traveling')
    end

    it 'leads to correct page when link is clicked' do
      click_link 'Traveling'
      expect(current_path).to eq(category_path(@category))
    end

    it 'has the add new category link' do
      expect(page).to have_link('Add New Category')
    end

    it 'leads to a page to add a new category' do
      click_link 'Add New Category'
      expect(current_path).to eq(new_category_path)
    end
  end
end
