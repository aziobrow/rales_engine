require 'rails_helper'

describe "Single Merchant Business Analytics Endpoints API" do
  before do
    @merchant = create(:merchant)
    item = create(:item, merchant: @merchant)
    success_transaction = create(:transaction, result: "success", invoice: invoice1)
    failed_transaction = create(:transaction, result: "failed", invoice: invoice2)
    @time = Date.now
    invoice1 = create(:invoice, merchant: @merchant)
    invoice2 = create(:invoice, merchant: @merchant, created_at: @time)
    create(:invoice_item, item: item, invoice: invoice1, quantity: 3, unit_price: 100)
    create(:invoice_item, item: item, invoice: invoice2, quantity: 2, unit_price: 500)
  end

    it "returns total revenue for merchant across successful transactions" do
      get "/api/v1/merchants/#{@merchant.id}/revenue"
      revenue = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(revenue[:revenue]).to eq("3.00")
    end

    it "returns total revenue for merchant for a specific invoice date" do
      get "/api/v1/merchants/#{@merchant.id}/revenue?date=#{@time}"
      revenue = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(revenue[:revenue]).to eq("10.00")
    end
end
