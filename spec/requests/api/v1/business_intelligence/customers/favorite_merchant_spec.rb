require 'rails_helper'

describe "Customers Business Analytics Endpoints API" do
  it "returns a merchant where the customer has conducted most successful transactions" do
    @merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    @customer = create(:customer)
    invoice1 = create(:invoice, customer: @customer, merchant: @merchant1)
    invoice2 = create(:invoice, customer: @customer, merchant: merchant2)
    create(:transaction, result: "success", invoice: invoice1)
    create(:transaction, result: "success", invoice: invoice1)
    create(:transaction, result: "failed", invoice: invoice2)
    create(:transaction, result: "success", invoice: invoice2)

    get "/api/v1/customers/#{@customer.id}/favorite_merchant"
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(merchant[:id]).to eq(@merchant1.id)
  end
end
