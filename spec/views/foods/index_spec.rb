RSpec.describe "Foods index page", type: :view do
  before(:each) do
    @user = User.create(name: 'Lugard', email:'lugard@lion.com', password:'123456', confirmed_at:Time.now)
    @food = Food.create(name: 'Banana', measurement_unit: 'kg', price: 1.5, quantity: 10, user: @user)
    # ...
    visit 'users/sign_in'
      fill_in 'Email', with: 'lugard@lion.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
  end

  it "shows the foods details" do
    render
    expect(rendered).to have_content('ID')
    expect(rendered).to have_content('Name')
    expect(rendered).to have_content('Measurement Unit')
    expect(rendered).to have_content('Price')
    expect(rendered).to have_content('Quantity')
    expect(rendered).to have_content('Action')
    # ... other expectations
  end
end
