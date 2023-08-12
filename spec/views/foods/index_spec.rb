require 'rails_helper'

RSpec.describe "Foods index page", type: :feature do
  let(:user) { create(:user) } # You would need to create a user factory or use your preferred method to create a user
  let!(:food1) { create(:food, name: "Banana", user: user) }
  let!(:food2) { create(:food, name: "Apple") } # Food not owned by the user

  before do
    login_as(user) # Assuming you have a method to log in the user
    visit foods_path
  end

  it "displays the list of foods owned by the user" do
    within('.food-list') do
      expect(page).to have_content("Foods")
      expect(page).to have_link("New food", href: new_food_path)
      
      within('#foods') do
        expect(page).to have_selector('table.foods-table')
        expect(page).to have_content(food1.name)
        expect(page).to have_content(food1.measurement_unit)
        expect(page).to have_content(food1.price)
        expect(page).to have_content(food1.quantity)
        expect(page).to have_button("Delete this food", count: 1) # Assuming only one food is owned by the user
        
        expect(page).not_to have_content(food2.name) # Food not owned by the user
      end
    end
  end
end