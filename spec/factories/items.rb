FactoryBot.define do
  factory :item do
    sequence(:name)  {|n| "Name#{n}" }
    sequence(:description)  {|n| "Description for Item Name#{n}" }
    unit_price 100
    merchant
  end
end
