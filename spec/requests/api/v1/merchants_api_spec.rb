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
end
