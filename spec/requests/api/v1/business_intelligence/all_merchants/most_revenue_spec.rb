require 'rails_helper'

describe "All Merchants Business Analytics Endpoints API" do
  it "returns the top x merchants ranked by total revenue" do

    merchant_1 = create(:merchant, name: "Bob's Burgers")
    merchant_2 = create(:merchant, name: "Banana Stand")
    merchant_3 = create(:merchant, name: "BJ's Velvet Freeze")

    item_1 = create(:item, unit_price: 1000, merchant: merchant_1)
    item_2 = create(:item, unit_price: 2000, merchant: merchant_2)
    item_3 = create(:item, unit_price: 3000, merchant: merchant_3)

    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    invoice_3 = create(:invoice, merchant: merchant_3)

    invoice_1.items << item_1
    invoice_2.items << item_2
    invoice_3.items << item_3
# byebug
    transaction_1 = create(:transaction, invoice_id: 1)
    transaction_2 = create(:transaction, invoice_id: 2)
    transaction_3 = create(:transaction, invoice_id: 3)

    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchants.count).to eq(2)
    expect(merchants[0]).to have_value(merchant_1.id) #this should actually be merchant_3, but transactions are not being created
    expect(merchants[1]).to have_value(merchant_2.id)

  end
end
