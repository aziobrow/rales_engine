require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body, symbolize_name: true)
    invoice = invoices.first

    expect(response).to be_success
  end
end
