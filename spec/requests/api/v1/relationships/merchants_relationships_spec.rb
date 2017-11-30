require 'rails_helper'

describe "Invoice Items Relationship Endpoints API" do
  it "returns a collection of items associated with that merchant" do

    merchant = create(:merchant)
    item_collection = create_list(:item, 3, merchant: merchant)
    sad_merchant = create(:merchant)
    sad_item = create(:item, merchant: sad_merchant)

    get "/api/v1/merchants/#{merchant.id}/items"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0]).to have_value(item_collection[0][:name])
    expect(items[1]).to have_value(item_collection[1][:name])
    expect(items[2]).to have_value(item_collection[2][:name])
    expect(items[0]).to_not have_value(sad_item[:name])
    expect(items[1]).to_not have_value(sad_item[:name])
    expect(items[2]).to_not have_value(sad_item[:name])
  end




  it "returns invoices associated with that merchant" do
    merchant = create(:merchant)
    invoice_collection = create_list(:invoice, 3, merchant_id: merchant.id)

    sad_merchant = create(:merchant)
    sad_invoice = create(:invoice, merchant_id: sad_merchant.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"
    expect(response).to be_success

    invoices = JSON.parse(response.body, symbolize_names: true)
    # byebug

    expect(invoices[0]).to have_value(invoice_collection[0][:customer_id])
    expect(invoices[1]).to have_value(invoice_collection[1][:customer_id])
    expect(invoices[2]).to have_value(invoice_collection[2][:customer_id])
    expect(invoices[0]).to_not have_value(sad_invoice[:customer_id])
    expect(invoices[1]).to_not have_value(sad_invoice[:customer_id])
    expect(invoices[2]).to_not have_value(sad_invoice[:customer_id])

  end
end
