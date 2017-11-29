require 'rails_helper'

describe "Item_invoices Find All API" do
  before do
    @invoice_item = create(:invoice_item, name: "Aurora", updated_at: Time.now)
    @second_invoice_item = create(:invoice_item, name: "Aurora", created_at: @invoice_item.updated_at)
    @last_invoice_item = create(:invoice_item, created_at: @invoice_item.updated_at)
  end

  it "finds all by id" do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items.first).to have_value(@invoice_item.id)
  end

  it "finds all by name" do
    get "/api/v1/invoice_items/find_all?name=#{@invoice_item.name}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first).to have_value(@invoice_item.id)
    expect(invoice_items.second).to have_value(@second_invoice_item.id)
  end

  xit "finds all by created at date" do
    get "/api/v1/invoice_items/find_all?created_at=#{@second_invoice_item.created_at}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first).to have_value(@second_invoice_item.id)
    expect(invoice_items.second).to have_value(@last_invoice_item.id)
  end

  xit "finds all by updated at date" do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item.updated_at}"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(1)
    expect(invoice_items.first).to have_value(@invoice_item.id)
  end
end
