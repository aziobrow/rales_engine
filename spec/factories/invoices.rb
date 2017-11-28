FactoryBot.define do
  factory :invoice do
    customer_id 1
    merchant_id 1
    status "shipped"
    created_at "Time1"
    updated_at "Time2"
  end
end
