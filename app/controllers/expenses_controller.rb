class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.all.order('created_at DESC')
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(name: params[:expense][:name],
                                      amount: params[:expense][:amount],
                                      user_id: current_user.id,
                                      group_id: @group.id)

    respond_to do |format|
      if @expense.save
        format.html do
          redirect_to group_expenses_path, notice: 'Your transaction has been successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
