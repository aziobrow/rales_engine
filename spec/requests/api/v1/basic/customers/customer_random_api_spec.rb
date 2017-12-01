require 'rails_helper'

describe "Customers Find API" do
  before do
    create_list(:customer, 3)
    @customer = Customer.first
    @second_customer = Customer.second
    @last_customer = Customer.last
  end

  it "returns a random resource" do
    get "/api/v1/customers/random"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_key(:id)
    expect(customer_info).to have_key(:first_name)
    expect(customer_info).to have_key(:last_name)
  end


end
