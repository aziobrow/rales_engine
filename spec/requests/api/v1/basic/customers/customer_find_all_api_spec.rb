require 'rails_helper'

describe "Customers Find All API" do
  before do
    @customer = create(:customer, first_name: "Aurora", updated_at: "2012-03-27 14:54:05 UTC")
    @second_customer = create(:customer, first_name: "Aurora", last_name: "Zio", created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
    @last_customer = create(:customer, last_name: "Zio", created_at: "2012-03-27 14:54:05 UTC")
  end

  it "finds all by id" do
    get "/api/v1/customers/find_all?id=#{@customer.id}"
    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customers.count).to eq(1)
    expect(customers.first).to have_value(@customer.id)
  end

  it "finds all by first name" do
    get "/api/v1/customers/find_all?first_name=#{@customer.first_name}"
    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customers.count).to eq(2)
    expect(customers.first).to have_value(@customer.id)
    expect(customers.second).to have_value(@second_customer.id)
  end

  it "finds all by last name" do
    get "/api/v1/customers/find_all?last_name=#{@second_customer.last_name}"
    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customers.count).to eq(2)
    expect(customers.first).to have_value(@second_customer.id)
    expect(customers.second).to have_value(@last_customer.id)
  end

  it "finds all by created at date" do
    get "/api/v1/customers/find_all?created_at=2012-03-27 14:54:05 UTC"
    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customers.count).to eq(2)
    expect(customers.first).to have_value(@second_customer.id)
    expect(customers.second).to have_value(@last_customer.id)
  end

  it "finds all by updated at date" do
    get "/api/v1/customers/find_all?updated_at=2012-03-27 14:54:05 UTC"
    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customers.count).to eq(2)
    expect(customers.first).to have_value(@customer.id)
    expect(customers.second).to have_value(@second_customer.id)
  end
end
