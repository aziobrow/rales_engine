require 'rails_helper'

describe "Invoice Items Relationship Endpoints API" do
  before do
    @item = create(:item)
    @invoice = create(:invoice)
    @invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id)
  end

  it "finds associated invoice for one invoice item" do
    get "/api/v1/invoice_items/:id/invoice"
    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice).to have_value(@invoice.id)
  end

  it "finds associated item for one invoice item" do
    get "/api/v1/invoice_items/:id/item"
    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(item).to have_value(@item.id)
  end
end
