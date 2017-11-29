FactoryBot.define do
  factory :invoice do

    sequence(:customer_id)  {|n| "#{n}" }
    sequence(:merchant_id)  {|n| "#{n}" }
    status "shipped"
    created_at "Time1"
    updated_at "Time2"
  end
end
