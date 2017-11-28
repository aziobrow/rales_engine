require 'rails_helper'

describe "Search Invoices using find and parameters" do
  it "returns an invoice based on the id" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    get "/api/v1/invoices/find?id=#{invoice.id}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)

  end

  it "returns an invoice based on the status" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    get "/api/v1/invoices/find?status=#{invoice.status}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)

  end

  xit "returns an invoice based on the created_at date time" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    byebug

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)

  end

  it "returns an invoice based on a random selection" do
    create_list(:invoice, 3)
    invoice = Invoice.last

    get "/api/v1/invoices/random?"
    expect(response).to be_success

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)
  end

end
