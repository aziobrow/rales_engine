require 'rails_helper'

describe "Customers Find API" do
  before do
    create_list(:customer, 3, created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
    @customer = Customer.first
    @second_customer = Customer.second
    @last_customer = Customer.last
  end

  it "finds by id" do
    get "/api/v1/customers/find?id=#{@customer.id}"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_value(@customer.id)
    expect(customer_info).to have_value(@customer.first_name)
    expect(customer_info).to have_value(@customer.last_name)
    expect(customer_info).to_not have_value(@last_customer.id)
    expect(customer_info).to_not have_value(@second_customer.id)
  end

  it "finds by first name" do
    get "/api/v1/customers/find?first_name=#{@last_customer.first_name}"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_value(@last_customer.id)
    expect(customer_info).to have_value(@last_customer.first_name)
    expect(customer_info).to have_value(@last_customer.last_name)
    expect(customer_info).to_not have_value(@customer.id)
    expect(customer_info).to_not have_value(@second_customer.id)
  end

  it "finds by last name" do
    get "/api/v1/customers/find?last_name=#{@last_customer.last_name}"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_value(@last_customer.id)
    expect(customer_info).to have_value(@last_customer.first_name)
    expect(customer_info).to have_value(@last_customer.last_name)
    expect(customer_info).to_not have_value(@customer.id)
    expect(customer_info).to_not have_value(@second_customer.id)
  end

  it "finds by created at date" do
    get "/api/v1/customers/find?created_at=2012-03-27 14:54:05 UTC"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_value(@customer.id)
    expect(customer_info).to have_value(@customer.first_name)
    expect(customer_info).to have_value(@customer.last_name)
    expect(customer_info).to_not have_value(@last_customer.id)
    expect(customer_info).to_not have_value(@second_customer.id)
  end

  it "finds by updated at date" do
    get "/api/v1/customers/find?updated_at=2012-03-27 14:54:05 UTC"
    customer_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer_info).to have_value(@customer.id)
    expect(customer_info).to have_value(@customer.first_name)
    expect(customer_info).to have_value(@customer.last_name)
    expect(customer_info).to_not have_value(@last_customer.id)
    expect(customer_info).to_not have_value(@second_customer.id)
  end
end
