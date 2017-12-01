require 'rails_helper'

describe "Search Invoices using find_all and parameters" do

  it "returns all invoices based on the status" do
    invoice_collection = create_list(:invoice, 2, created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
    invoice_1 = invoice_collection.first
    invoice_2 = invoice_collection.second
    invoice_3 = create(:invoice)

    get "/api/v1/invoices/find_all?status=shipped"
    expect(response).to be_success

    invoices = JSON.parse(response.body, symbolize_names: true)
    expect(invoices.count).to eq(3)
    expect(invoices[0]).to have_value(invoice_1.id)
    expect(invoices[1]).to have_value(invoice_2.id)
    expect(invoices[2]).to have_value(invoice_3.id)

  end

  it "returns all invoices based on the merchant_id" do
    merchant = create(:merchant)
    invoices = create_list(:invoice, 2, merchant: merchant)
    invoice_1 = invoices.first
    invoice_2 = invoices.second

    invoice_3 = create(:invoice)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
    expect(response).to be_success

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(invoices.count).to eq(2)
    expect(invoices[0]).to have_value(invoice_1.merchant_id)
    expect(invoices[1]).to have_value(invoice_1.merchant_id)

  end

  it "returns all invoices based on the created_at date time" do
    invoice_collection = create_list(:invoice, 2, created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
    invoice_1 = invoice_collection.first
    invoice_2 = invoice_collection.second
    invoice_3 = create(:invoice)

    get "/api/v1/invoices/find_all?created_at=2012-03-27 14:54:05 UTC"

    invoices = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoices[0]).to have_value(invoice_1.id)
    expect(invoices[1]).to have_value(invoice_2.id)

  end

  it "returns all invoices based on the updated_at date time" do
    invoice_collection = create_list(:invoice, 2, created_at: "2012-03-27 14:54:05 UTC", updated_at: "2012-03-27 14:54:05 UTC")
    invoice_1 = invoice_collection.first
    invoice_2 = invoice_collection.second
    invoice_3 = create(:invoice)

    get "/api/v1/invoices/find_all?created_at=2012-03-27 14:54:05 UTC"

    invoices = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoices[0]).to have_value(invoice_1.id)
    expect(invoices[1]).to have_value(invoice_2.id)
  end

end
