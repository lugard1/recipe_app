require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user1 = User.create(name: 'Lugard', email: 'lugard@lion.com', password: '123456', confirmed_at: Time.now)
      @food1 = Food.create(name: 'Yam', measurement_unit: 'kg', price: 10, quantity: 2, user_id: @user1.id)
      @food2 = Food.create(name: 'Rice', measurement_unit: 'kg', price: 20, quantity: 5, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'lugard@lion.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'displays Foods list in navbar' do
      visit 'foods'
      expect(page).to have_content 'Food'
    end

    it 'displays a list of the foods' do
      visit 'foods'
      expect(page).to have_content 'Yam'
      expect(page).to have_content 'Rice'
    end

    it 'has a button to add new food' do
      visit 'foods'
      expect(page).to have_content 'New Food'
    end

    it 'should take you to create food form when clicking on the button' do
      visit 'foods'
      click_on 'New Food'
      expect(current_path).to eql new_user_food_path(@user1)
    end
  end
end