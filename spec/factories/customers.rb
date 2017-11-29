FactoryBot.define do
  factory :customer do
    sequence(:first_name) {|n| "#{n}Customer"}
    sequence(:last_name) {|n| "Customer#{n}"}
  end
end
