require 'rails_helper'

describe "Merchants Find All API" do
  before do
    @merchant = create(:merchant, name: "Aurora", updated_at: "2012-03-27 14:54:05 UTC")
    @second_merchant = create(:merchant, name: "Aurora", created_at: "2012-03-27 14:54:05 UTC")
    @last_merchant = create(:merchant, created_at: "2012-03-27 14:54:05 UTC")
  end

  it "finds all by id" do
    get "/api/v1/merchants/find_all?id=#{@merchant.id}"
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(1)
    expect(merchants.first).to have_value(@merchant.id)
  end

  it "finds all by name" do
    get "/api/v1/merchants/find_all?name=#{@merchant.name}"
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(2)
    expect(merchants.first).to have_value(@merchant.id)
    expect(merchants.second).to have_value(@second_merchant.id)
  end

  it "finds all by created at date" do

    get "/api/v1/merchants/find_all?created_at=2012-03-27 14:54:05 UTC"
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(2)
    expect(merchants.first).to have_value(@second_merchant.id)
    expect(merchants.second).to have_value(@last_merchant.id)
  end

  it "finds all by updated at date" do
    get "/api/v1/merchants/find_all?updated_at=2012-03-27 14:54:05 UTC"
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(1)
    expect(merchants.first).to have_value(@merchant.id)
  end
end
