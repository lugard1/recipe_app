FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food #{n}" }
    measurement_unit { 'kg' }
    price { 1.5 }
    quantity { 10 }
    user
  end
end
