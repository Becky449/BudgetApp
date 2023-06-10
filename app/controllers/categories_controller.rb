class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = if current_user
                    Category.where(author: current_user).order(created_at: :desc)
                  else
                    Category.all.order(created_at: :desc)
                  end
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path
    else
      flash[:notice] = 'Could not create category successfully'
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'The category was successfully deleted'
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:icon, :name)
  end
end
