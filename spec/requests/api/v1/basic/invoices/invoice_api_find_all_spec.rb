require 'rails_helper'

describe "Search Invoices using find_all and parameters" do

  it "returns all invoices based on the status" do
    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?status=shipped"
    expect(response).to be_success

    invoices = JSON.parse(response.body, symbolize_names: true)
    expect(invoices.count).to eq(3)
    expect(invoices[0][:customer_id]).to eq(1)
    expect(invoices[0][:merchant_id]).to eq(1)
    expect(invoices[2][:customer_id]).to eq(3)
    expect(invoices[2][:merchant_id]).to eq(3)

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

end
