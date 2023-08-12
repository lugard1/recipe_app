FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe #{n}" }
    preparation_time { 30 } # Adjust as needed
    cooking_time { 45 } # Adjust as needed
    description { 'This is a recipe description.' }
    user
  end
end
