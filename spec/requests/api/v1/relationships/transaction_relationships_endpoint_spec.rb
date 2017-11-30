require 'rails_helper'

describe "Transactions relationship endpoints" do
  it "returns the associated invoice" do

    invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice.id)

    sad_invoice = create(:invoice)
    sad_transaction = create(:transaction, invoice_id: sad_invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    happy_invoice = JSON.parse(response.body, symbolize_names: true)
# byebug

    expect(response).to be_success
    expect(happy_invoice).to have_value(invoice.customer_id)
    expect(happy_invoice).to_not have_value(sad_invoice.customer_id)

  end
end
