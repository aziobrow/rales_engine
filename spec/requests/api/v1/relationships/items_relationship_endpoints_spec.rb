require 'rails_helper'

describe "Items Relationship Endpoints API" do
  before do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)
    invoice = create(:invoice, merchant_id: @merchant.id)
    @invoice_item1 = create(:invoice_item, item_id: @item.id, invoice_id: invoice.id)
    @invoice_item2 = create(:invoice_item, item_id: @item.id, invoice_id: invoice.id)
  end

<<<<<<< HEAD
    it "finds associated invoice items for one item" do
      get "/api/v1/items/#{@item.id}/invoice_items"
      invoice_items = JSON.parse(response.body, symbolize_names: true)
=======
  it "finds associated invoice items for one item" do
    get "/api/v1/items/:id/invoice_items"
    invoice_items = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 075344c79d5b305dd7ec5363d0d40f09b675fc0c

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first).to have_value(@invoice_item1.id)
    expect(invoice_items.last).to have_value(@invoice_item2.id)
  end

<<<<<<< HEAD
    it "finds associated merchant for one item" do
      get "/api/v1/items/#{@item.id}/merchant"
      merchant = JSON.parse(response.body, symbolize_names: true)
=======
  it "finds associated merchant for one item" do
    get "/api/v1/items/:id/merchant"
    merchant = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 075344c79d5b305dd7ec5363d0d40f09b675fc0c

    expect(response).to be_success
    expect(merchant).to have_value(@merchant.id)
  end
end
