require 'rails_helper'

describe "Items Business Analytics Endpoints API" do
  before do
    @item1 = create(:item)
    @item2 = create(:item)
    item3 = create(:item)
    @item4 = create(:item)
    date = Date.new
    later_date = Date.new + 3.days
    invoice1 = create(:invoice)
    @invoice2 = create(:invoice, created_at: date)
    @invoice3 = create(:invoice, created_at: later_date)
    create(:invoice_item, item: @item2, quantity: 5, invoice: invoice1)
    create(:invoice_item, item: @item1, quantity: 3)
    create(:invoice_item, item: @item4, quantity: 2)
    create(:invoice_item, item: item3, quantity: 1)
    create(:invoice_item, item: @item2, quantity: 10, invoice: invoice2)
  end

    it "returns the top x items ranked by quantity sold" do
      get "/api/v1/items/most_items?quantity=3"
      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(items.count).to eq(3)
      expect(items.first[:id]).to eq(@item2.id)
      expect(items.second[:id]).to eq(@item1.id)
      expect(items.last[:id]).to eq(@item4.id)
    end

    it "returns the date with the most sales for the given item using the invoice date" do
      get "/api/v1/items/#{@item1.id}/best_day"
      date = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(date[:date]).to eq(@invoice2.created_at)
    end

    it "returns the most recent date with most sales if two dates have the same number of sales" do
      create(:invoice_item, item: @item2, quantity: 10, invoice: @invoice3)

      get "/api/v1/items/#{@item1.id}/best_day"
      date = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(date[:date]).to eq(@invoice3.created_at)
    end
end
