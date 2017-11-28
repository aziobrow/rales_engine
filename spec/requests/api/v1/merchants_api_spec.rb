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

  it "creates a new merchant" do
    merchant_params = { name: "Lauren Smith"}

    post "/api/v1/merchants", params: {merchant: merchant_params}
    merchant = Merchant.last

    expect(response).to be_success
    expect(merchant.name).to eq(merchant_params[:name])
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
end
