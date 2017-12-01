require 'rails_helper'

describe "All Merchants Business Analytics Endpoints API" do
  it "returns the top x merchants ranked by total revenue" do

    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)
    merchant4 = create(:merchant)
    merchant5 = create(:merchant)

    create_list(:invoice, 3, merchant_id: merchant4.id)
    create_list(:invoice, 2, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant5.id)


    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchants.first[:id]).to eq(@merchant4.id)



  end
end
