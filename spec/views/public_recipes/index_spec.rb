require 'rails_helper'

RSpec.describe 'public_recipes/index.html.erb', type: :view do
  before do
    @user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')

    # Mock a user session for the view
    allow(view).to receive(:current_user).and_return(@user)

    @recipe1 = Recipe.create(name: 'Recipe 1', user: @user)
    @recipe2 = Recipe.create(name: 'Recipe 2', user: @user)
    assign(:public_recipes, [@recipe1, @recipe2])
    render
  end

  it "displays the title 'Public Recipes'" do
    expect(rendered).to have_selector('.recipe-title', text: 'Public Recipes')
  end

  it 'displays recipe names and creators' do
    expect(rendered).to have_selector('.recipe-name', text: 'Recipe 1')
    expect(rendered).to have_selector('.recipe-name', text: 'Recipe 2')
    expect(rendered).to have_selector('.recipe-creator', text: /\A\s*By:\s*John Doe\s*\z/, count: 2)
  end

  it 'displays total items and total price for each recipe' do
    expect(rendered).to have_selector('.total-items', text: /\A\s*Total Items:\s*0\s*\z/, count: 2)
    expect(rendered).to have_selector('.total-price', text: /\A\s*Total Price:\s*\$0.00\s*\z/, count: 2)
  end

  it 'renders links to recipe show pages' do
    expect(rendered).to have_link('Recipe 1', href: recipe_path(@recipe1))
    expect(rendered).to have_link('Recipe 2', href: recipe_path(@recipe2))
  end
end
