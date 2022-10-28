class ExpensesController < ApplicationController
  before_action :set_group

  def index
    @user = current_user
    @expenses = @group.expenses
    @total = @expenses.sum(:amount)
  end

  def new
    @expense = Expense.new
    
  end

  def create
    @user = User.find(params[:user_id])
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    if @expense.valid?
      @expense.save
      @expense.groups.push(@group)
      flash[:notice] = 'New Transaction Created Successfully'
      redirect_to user_group_expenses_path
    else
      render :new
    end
  end

  def destroy
    @expense = Expense.find(id: params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to user_group_expenses_path, notice: 'Budget has been successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
