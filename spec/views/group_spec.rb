require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
    before(:each) do
        @user = User.create(name: 'Afolabi', email: '123abc@gmail.com', password: '123456')
        @group = @user.groups.create(name: 'Travel', icon: 'https://meghee.com/wp-content/uploads/2021/03/travel.jpg',
            user_id: @user.id)

        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Log in'
    end
    
    describe 'Visit group\'s index page' do
        it 'should have group header' do
            visit new_user_group_path
            expect(page).to have_content('Transaction')
        end

        it 'should have a group name' do
            visit groups_path
            expect(page).to have_content('Travel')
        end
    end
end