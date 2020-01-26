class ExpensesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index 
     @expenses = current_user.expenses.page(params[:page])
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    unless Date.valid_date?(expense_params['date(1i)'].to_i,expense_params['date(2i)'].to_i,expense_params['date(3i)'].to_i)
      @expense = Expense.new
      flash.now[:danger] = '家計簿が登録されませんでした'
      render :new
      return
    end
    
    @expense = current_user.expenses.build(expense_params)
    
    if @expense.save
      flash[:success] = '家計簿が正常に登録されました'
      redirect_to root_url
    else
      @expenses = current_user.expenses.order(id: :desc).page(params[:page])
      flash.now[:danger] = '家計簿が登録されませんでした'
      render :new 
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = '家計簿は正常に更新されました'
      redirect_to @expense
    else
      flash.now[:danger] = '家計簿は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @expense.destroy
    flash[:success] = '家計簿は正常に更新されました'
      #redirect_back(fallback_location: root_path)
    redirect_to expenses_url
  end

  private

  # Strong Parameter
  def expense_params
    params
    .require(:expense)
    .permit(:memo, :date, :price)
  end
  
  def correct_user
    @expense = current_user.expenses.find_by(id: params[:id])
    unless @expense
      redirect_to root_url
    end
  end
  
end