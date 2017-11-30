require 'rails_helper'

describe "Search Invoices using random" do

  it "returns an invoice based on a random selection" do
    create_list(:invoice, 3)
    @invoice = Invoice.last

    get "/api/v1/invoices/random"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)
    expect(invoice).to have_key(:merchant_id)
    expect(invoice).to have_key(:customer_id)
  end

end
