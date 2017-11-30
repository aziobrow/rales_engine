require 'rails_helper'

describe "InvoiceItems API" do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 3)
    get "/api/v1/invoice_items"
    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item = invoice_items.first


    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to_not have_key(:created_at)
    expect(invoice_item).to_not have_key(:updated_at)
  end

  it "sends a single invoice_item" do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_key(:item_id)
    expect(invoice_item_info).to have_key(:invoice_id)
    expect(invoice_item_info).to have_value(invoice_item.id)
    expect(invoice_item_info).to have_value(invoice_item.item_id)
    expect(invoice_item_info).to have_value(invoice_item.invoice_id)
  end

  it "includes only id and name" do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_key(:item_id)
    expect(invoice_item_info).to have_key(:invoice_id)
    expect(invoice_item_info).to_not have_key(:created_at)
    expect(invoice_item_info).to_not have_key(:updated_at)
  end
end
