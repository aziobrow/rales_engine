FactoryBot.define do
  factory :invoice_item do

    sequence(:id)  {|n| "#{n}" }
    sequence(:invoice_id)  {|n| "#{n}" }
    sequence(:item_id)  {|n| "#{n}" }
    quantity 1
    unit_price 100

  end
end
