FactoryBot.define do
  factory :invoice do

    sequence(:customer_id)  {|n| "#{n}" }
    sequence(:merchant_id)  {|n| "#{n}" }
    status "shipped"

  end
end
