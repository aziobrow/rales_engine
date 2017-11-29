require 'rails_helper'

describe "ItemInvoices Find API" do
  before do
    create_list(:invoice_item, 3)
    @invoice_item_1 = ItemInvoice.first
    @invoice_item_2 = ItemInvoice.second
    @invoice_item_3 = ItemInvoice.last
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
    expect(invoice_item_info).to have_value(@invoice_item_1.unit_price)

    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_3.id)
  end

  xit "finds by name" do
    get "/api/v1/invoice_items/find?name=#{@invoice_item_3.name}"
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
    expect(invoice_item_info).to have_value(@invoice_item_1.unit_price)

    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_3.id)
  end

  xit "finds by created at date" do
    get "/api/v1/invoice_items/find?created_at=#{@invoice_item_2.created_at}"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_key(:name)
    expect(invoice_item_info).to have_value(@invoice_item_2.id)
    expect(invoice_item_info).to have_value(@invoice_item_2.name)
    expect(invoice_item_info).to_not have_value(@invoice_item_3.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
  end

  xit "finds by updated at date" do
    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_3.updated_at}"
    invoice_item_info = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoice_item_info).to have_key(:id)
    expect(invoice_item_info).to have_key(:name)
    expect(invoice_item_info).to have_value(@invoice_item_3.id)
    expect(invoice_item_info).to have_value(@invoice_item_3.item_id)
    expect(invoice_item_info).to have_value(@invoice_item_3.invoice_id)
    expect(invoice_item_info).to have_value(@invoice_item_3.quantity)
    expect(invoice_item_info).to have_value(@invoice_item_3.unit_price)
    expect(invoice_item_info).to_not have_value(@invoice_item_1.id)
    expect(invoice_item_info).to_not have_value(@invoice_item_2.id)
  end
end
