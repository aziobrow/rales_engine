require 'rails_helper'

describe "Merchants Find API" do
  before do
    create_list(:merchant, 3)
    @merchant = Merchant.first
    @second_merchant = Merchant.second
    @last_merchant = Merchant.last
  end

  it "finds by id" do
    get "/api/v1/merchants/find?id=#{@merchant.id}"
    merchant_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(@merchant.id)
    expect(merchant_info).to have_value(@merchant.name)
    expect(merchant_info).to_not have_value(@last_merchant.id)
    expect(merchant_info).to_not have_value(@second_merchant.id)
  end

  it "finds by name" do
    get "/api/v1/merchants/find?name=#{@last_merchant.name}"
    merchant_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(@last_merchant.id)
    expect(merchant_info).to have_value(@last_merchant.name)
    expect(merchant_info).to_not have_value(@merchant.id)
    expect(merchant_info).to_not have_value(@second_merchant.id)
  end

  it "finds by created at date" do
    merchant = create(:merchant, created_at: "2012-03-27 14:54:05 UTC")
    get "/api/v1/merchants/find?created_at=2012-03-27 14:54:05 UTC"
    merchant_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(merchant.id)
    expect(merchant_info).to have_value(merchant.name)
    expect(merchant_info).to_not have_value(@merchant.id)
    expect(merchant_info).to_not have_value(@second_merchant.id)
    expect(merchant_info).to_not have_value(@last_merchant.id)
  end

  it "finds by updated at date" do
    merchant = create(:merchant, updated_at: "2012-03-27 14:54:05 UTC")
    get "/api/v1/merchants/find?updated_at=2012-03-27 14:54:05 UTC"
    merchant_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(merchant.id)
    expect(merchant_info).to have_value(merchant.name)
    expect(merchant_info).to_not have_value(@merchant.id)
    expect(merchant_info).to_not have_value(@second_merchant.id)
    expect(merchant_info).to_not have_value(@last_merchant.id)
  end
end
