require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'Afolabi', email: '123abc@gmail.com') }
    before { subject.save }

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'email should not be blank' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end
end
