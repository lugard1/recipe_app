FactoryBot.define do
  factory :user do
    name { 'Lugard' }
    email { 'lugard@lion.com' }
    password { '123456' }
    confirmed_at { Time.now }
  end
end