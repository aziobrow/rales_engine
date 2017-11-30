require 'rails_helper'

describe "Invoices Relationship Endpoints API" do
  before do
    @merchant = create(:merchant)
    @customer = create(:customer)
    @item1 = create(:item, merchant_id: @merchant.id)
    @item2 = create(:item)
    invoice = create(:invoice, merchant_id: @merchant.id, customer_id: @customer.id)
    @transaction1 = create(:transaction, invoice_id: invoice.id)
    @transaction2 = create(:transaction, invoice_id: invoice.id)
    @invoice_item1 = create(:invoice_item, invoice_id: invoice.id)
    @invoice_item2 = create(:invoice_item, invoice_id: invoice.id)
  end

  end

  it "finds associated transactions for one invoice" do
    get "/api/v1/invoices/:id/transactions"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions.first).to have_value(@transaction1.id)
    expect(transactions.last).to have_value(@transaction2.id)
  end

  it "finds associated invoice items for one invoice" do
    get "/api/v1/invoices/:id/invoice_items"
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
    expect(invoice_items.first).to have_value(@invoice_item1.id)
    expect(invoice_items.last).to have_value(@invoice_item2.id)
  end

  it "finds associated items for one invoice" do
    get "/api/v1/invoices/:id/items"
    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(items.first).to have_value(@item1.id)
    expect(items.last).to have_value(@item2.id)
  end

  it "finds associated customer for one invoice" do
    get "/api/v1/invoices/:id/customer"
    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer).to have_value(@customer.id)
  end

  it "finds associated merchant for one invoice" do
    get "/api/v1/invoices/:id/merchant"
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(customer).to have_value(@merchant.id)
  end

end
