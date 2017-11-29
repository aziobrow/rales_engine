FactoryBot.define do
  factory :transaction do
    sequence(:invoice_id)  {|n| n }
    result "success"
  end
end
