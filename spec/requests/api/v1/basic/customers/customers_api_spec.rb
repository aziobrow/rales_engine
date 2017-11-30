require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)
    get "/api/v1/customers"
    customers = JSON.parse(response.body, symbolize_names: true)
    customer = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customer).to have_key(:id)
    expect(customer).to have_key(:first_name)
    expect(customer).to have_key(:last_name)
  end

  it "sends a single customer" do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_key(:id)
    expect(customer_info).to have_key(:first_name)
    expect(customer_info).to have_key(:last_name)
    expect(customer_info).to have_value(customer.id)
    expect(customer_info).to have_value(customer.first_name)
    expect(customer_info).to have_value(customer.last_name)
  end

  it "includes only id, first name, and last name" do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_key(:id)
    expect(customer_info).to have_key(:first_name)
    expect(customer_info).to have_key(:last_name)
    expect(customer_info).to_not have_key(:created_at)
    expect(customer_info).to_not have_key(:updated_at)
  end
end
