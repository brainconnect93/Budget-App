class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    # @user = current_user
    # @expenses = @group.expenses
    # @total = @expenses.sum(:amount)
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.all.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new
    # @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(name: expense_params[:name], amount: expense_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_expenses_path(@group.id), notice: 'Transaction has been successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @user = User.find(params[:user_id])
  #   @expense = Expense.new(expense_params)
  #   @expense.user_id = current_user.id
  #   if @expense.valid?
  #     @expense.save
  #     @expense.groups.push(@group)
  #     flash[:notice] = 'New Transaction Created Successfully'
  #     redirect_to user_group_expenses_path
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @expense = Expense.find(id: params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to user_group_expenses_path, notice: 'Budget has been successfully removed.' }
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

  # def set_group
  #   @group = Group.find(params[:group_id])
  # end
end
