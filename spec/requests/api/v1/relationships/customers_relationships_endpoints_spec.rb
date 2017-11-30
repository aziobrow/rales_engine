require 'rails_helper'

describe "Customer relationship endpoints" do
  it "returns a collection of associated invoices" do

    customer = create(:customer)
    invoices = create_list(:invoice, 3, customer_id: customer.id)
    sad_customer = create(:customer)
    sad_invoice = create(:invoice, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    happy_invoices = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(happy_invoices[0]).to have_value(invoices[0][:merchant_id])
    expect(happy_invoices[1]).to have_value(invoices[1][:merchant_id])
    expect(happy_invoices[2]).to have_value(invoices[2][:merchant_id])
    expect(happy_invoices[0]).to_not have_value(sad_invoice[:merchant_id])
    expect(happy_invoices[1]).to_not have_value(sad_invoice[:merchant_id])
    expect(happy_invoices[2]).to_not have_value(sad_invoice[:merchant_id])

  end

  it "returns a collection of associated transactions" do

    customer = create(:customer)
    invoices = create_list(:invoice, 3, customer_id: customer.id)

    transaction_1 = create(:transaction, invoice_id: invoices[0].id)
    transaction_2 = create(:transaction, invoice_id: invoices[1].id)
    transaction_3 = create(:transaction, invoice_id: invoices[2].id)

    sad_customer = create(:customer)
    sad_invoice = create(:invoice, customer_id: customer.id)
    sad_transaction = create(:transaction, invoice_id: sad_invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    happy_transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(happy_transactions[0]).to have_value(transaction_1.invoice_id)
    expect(happy_transactions[1]).to have_value(transaction_2.invoice_id)
    expect(happy_transactions[2]).to have_value(transaction_3.invoice_id)
    expect(happy_transactions[0]).to_not have_value(sad_transaction.invoice_id)
    expect(happy_transactions[1]).to_not have_value(sad_transaction.invoice_id)
    expect(happy_transactions[2]).to_not have_value(sad_transaction.invoice_id)

  end


end
