require 'rails_helper'

describe "Search Invoices using find and parameters" do
  before do
    create_list(:invoice, 3)
    @invoice = Invoice.last
  end


  it "returns an invoice based on the id" do

    get "/api/v1/invoices/find?id=#{@invoice.id}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)

  end

  it "returns an invoice based on the status" do

    get "/api/v1/invoices/find?status=#{@invoice.status}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)

  end

  it "returns an invoice based on the created_at date time" do

    get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"
    expect(response).to be_success

    # invoice = JSON.parse(response.body, symbolize_names: true)
    # expect(invoice).to have_key(:id)
    # expect(invoice).to have_key(:status)

  end
end
