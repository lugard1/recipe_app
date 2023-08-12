require 'rails_helper'

RSpec.describe 'Recipes index page', type: :feature do
  let(:user) { create(:user) }
  let!(:recipe1) { create(:recipe, user:) }
  let!(:recipe2) { create(:recipe) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit recipes_path
  end

  it 'displays the list of recipes owned by the user' do
    within('.recipe_container') do
      expect(page).to have_content('Recipes')
      expect(page).to have_link('Add recipe', href: new_recipe_path)

      within('.recipes') do
        expect(page).to have_content(recipe1.name)
        expect(page).to have_content(recipe1.description)
        expect(page).to have_link('Delete', href: recipe_path(recipe1))

        expect(page).not_to have_content(recipe2.name)
      end
    end
  end
end
