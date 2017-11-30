require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)

  end

  it "returns values for a single invoice" do
    create_list(:invoice, 3)
    id = Invoice.last.id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(invoice).to have_key(:id)
    expect(invoice).to have_key(:status)
    expect(invoice).to have_key(:customer_id)
    expect(invoice).to_not have_key(:created_at)
    expect(invoice).to_not have_key(:updated_at)
  end
end
