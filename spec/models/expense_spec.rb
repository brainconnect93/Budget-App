require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @user = User.new(name: 'Afolabi', email: '123abc@gmail.com', password: 'password')
    @group = @user.groups.new(name: 'Travel', icon: 'https://meghee.com/wp-content/uploads/2021/03/travel.jpg',
                              user_id: @user.id)
    @expense = Expense.new(name: 'Flight', amount: 1000, group: @group, user_id: @user.id)
  end
  before { subject.save }

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be numeric value' do
    expect(subject.amount).to be_a_kind_of(Numeric)
  end

  it 'amount should be greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'should be associated to a group' do
    expect(subject).to respond_to(:group)
  end
end
