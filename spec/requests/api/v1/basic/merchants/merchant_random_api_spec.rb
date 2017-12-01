require 'rails_helper'

describe "Merchants Find API" do
  before do
    create_list(:merchant, 3)
    @merchant = Merchant.first
    @second_merchant = Merchant.second
    @last_merchant = Merchant.last
  end

  it "returns a random resource" do
    get "/api/v1/merchants/random"
    merchant_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant_info).to have_key(:id)
    expect(merchant_info).to have_key(:name)
  end


end
