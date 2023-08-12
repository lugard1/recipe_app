require 'rails_helper'

RSpec.describe 'recipe_foods/index', type: :feature do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }

  describe 'after log in' do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      visit recipe_path(recipe)
    end

    it 'displays the recipe details' do
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.preparation_time)
      expect(page).to have_content(recipe.cooking_time)
      expect(page).to have_content('Food')
      expect(page).to have_content('Generate Shopping List')
      expect(page).to have_content('Add Ingredient')
    end
  end
end
