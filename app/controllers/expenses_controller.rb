class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    @group = current_user.groups.find(params[:group_id])
    @expenses = @group.expenses
    @total = @group.expenses.sum(:amount)
  end

  def new
    @expense = Expense.new
    @current_user = current_user
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(name: expense_params[:name], amount: expense_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)
    respond_to do |format|
      if @expense.save
        format.html do
          redirect_to user_group_expenses_path(current_user, params[:group_id]),
                      notice: 'Transaction has been successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    @group = set_group
    respond_to do |format|
      format.html do
        redirect_to user_group_expenses_path(current_user, @group.id), notice: 'Budget has been successfully removed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
