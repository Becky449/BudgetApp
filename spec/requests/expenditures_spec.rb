require 'rails_helper'

RSpec.describe Expenditure, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Antonio', email: 'antonio@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @expenditure = Expenditure.create(name: 'Costumes', amount: 40, author_id: @user.id)
    @category = Category.create(name: 'Groceries', icon: 'shopping-bag.png', author_id: @user.id)
    @category_expenditure = CategoryExpenditure.create(category_id: @category.id, expenditure_id: @expenditure.id)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      get category_path(@category.id)
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show page' do
      expect(response).to render_template('show')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Costumes')
    end
  end
end
