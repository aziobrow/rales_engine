require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)
    get "/api/v1/merchants"
    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:name)
  end

  it "sends a single merchant" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"
    merchant_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to have_value(merchant.id)
    expect(merchant_info).to have_value(merchant.name)
  end

  it "includes only id and name" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"
    merchant_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
    expect(merchant_info).to_not have_key(:created_at)
    expect(merchant_info).to_not have_key(:updated_at)
  end
end
