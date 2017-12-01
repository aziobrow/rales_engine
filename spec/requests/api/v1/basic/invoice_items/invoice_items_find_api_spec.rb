require 'rails_helper'

describe "InvoiceItems Find API" do
  before do
    create_list(:invoice_item, 2)
    @invoice_item_1 = InvoiceItem.first
    @invoice_item_2 = InvoiceItem.second
    @invoice_item_3 = create(:invoice_item, created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
  end

  it "finds by id" do
    get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_key(:item_id)
    expect(invoice_item_info).to have_key(:invoice_id)
    expect(invoice_item_info).to have_value(@invoice_item_1.id)
    expect(invoice_item_info).to have_value(@invoice_item_1.item_id)
    expect(invoice_item_info).to have_value(@invoice_item_1.invoice_id)
    expect(invoice_item_info).to have_value(@invoice_item_1.item_id)
    expect(invoice_item_info).to have_value(@invoice_item_1.quantity)
    expect(invoice_item_info).to have_value((@invoice_item_1.unit_price).to_f / 100)

    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_3.id)
  end



  it "finds by created at date" do
    get "/api/v1/invoice_items/find?created_at=2012-03-27 14:54:05 UTC"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_value(@invoice_item_3.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_1.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
  end

  it "finds by updated at date" do
    get "/api/v1/invoice_items/find?updated_at=2012-03-27 14:54:05 UTC"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_value(@invoice_item_3.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_1.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
  end
end
