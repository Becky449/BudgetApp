class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.all.order(created_at: :desc)
  end

  def show
    @expenditure = Expenditure.find(params[:id])
  end

  def new
    @expenditure = Expenditure.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.author_id = current_user.id
    if @expenditure.save
      category_expenditure = CategoryExpenditure.new(category_id: params[:category_id], expenditure_id: @expenditure.id)
      category_expenditure.save
      redirect_to category_path(@category.id)
      flash[:notice] = 'Transaction added'
    else
      render :new
      flash[:notice] = 'Error adding Transaction'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @expenditure = Expenditure.find(params[:id])
    @expenditure.destroy
    flash[:notice] = 'Expenditure deleted successfully'
    redirect_to category_path(@category.id)
  end

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount)
  end
end
