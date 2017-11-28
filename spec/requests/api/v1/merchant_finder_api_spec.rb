require 'rails_helper'

describe "Merchants Finder API" do
  it "finds by id" do
    create_list(:merchant, 3)
    merchant = Merchant.first
    get "/api/v1/merchants/find?id=1"
    merchant_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(merchant.id)
    expect(merchant_info).to have_value(merchant.name)
  end
end
