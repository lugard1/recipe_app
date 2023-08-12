require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Lugard', email: 'lugard@lion.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'lugard@lion.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Lugard', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Lugard', email: 'lugard@lion.com')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
