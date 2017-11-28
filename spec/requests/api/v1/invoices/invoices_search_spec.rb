require 'rails_helper'

describe "Search Invoices using find and parameters" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    get "/api/v1/invoices/find?id=#{invoice.id}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)
    expect(invoice).to have_key(:created_at)

  end


end
