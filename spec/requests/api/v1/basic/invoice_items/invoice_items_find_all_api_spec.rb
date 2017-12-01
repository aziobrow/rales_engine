require 'rails_helper'

describe "InvoiceItems Find All API" do
  before do
    create_list(:invoice_item, 3)
    @invoice_item_1 = InvoiceItem.first
    @invoice_item_2 = InvoiceItem.second
    @invoice_item_3 = InvoiceItem.last
  end

  it "finds all by id" do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)
# byebug
    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items.first).to have_value(@invoice_item_1.id)
    expect(invoice_items.first).to have_value(@invoice_item_1.invoice_id)
    expect(invoice_items.first).to have_value(@invoice_item_1.item_id)
    expect(invoice_items.first).to have_value(@invoice_item_1.quantity)
    expect(invoice_items.first).to have_value((@invoice_item_1.unit_price).to_f / 100)
  end

  it "finds all by item_id" do
    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item_1.item_id}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items[0]).to have_value(@invoice_item_1.id)
    expect(invoice_items[0]).to_not have_value(@invoice_item_3.id)

  end

  it "finds all by quantity" do
    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item_1.quantity}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first).to have_value(@invoice_item_1.id)
    expect(invoice_items.last).to have_value(@invoice_item_3.id)

  end

  it "finds all by unit price" do
    get "/api/v1/invoice_items/find_all?unit_price=1.00"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first).to have_value(@invoice_item_1.id)
    expect(invoice_items.last).to have_value(@invoice_item_3.id)

  end

  xit "finds all by created date" do
    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_1.created_at}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items.first).to have_value(@invoice_item_1.id)

    expect(invoice_items).to_not have_value(@invoice_item_2.id)
  end

  xit "finds all by updated date" do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_1.updated_at}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items.first).to have_value(@invoice_item_1.id)

    expect(invoice_items.first).to_not have_value(@invoice_item_2.id)
  end


end
