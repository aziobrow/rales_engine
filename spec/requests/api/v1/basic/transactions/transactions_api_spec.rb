require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)
    get "/api/v1/transactions"
    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transaction).to have_key(:id)
    expect(transaction).to have_key(:invoice_id)
    expect(transaction).to have_key(:result)
  end

  it "sends a single transaction" do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_value(transaction.id)
    expect(transaction_info).to have_value(transaction.invoice_id)
    expect(transaction_info).to have_value(transaction.result)
  end

  it "includes only id, invoice id, and result" do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_key(:id)
    expect(transaction_info).to have_key(:invoice_id)
    expect(transaction_info).to have_key(:result)
    expect(transaction_info).to_not have_key(:credit_card_number)
    expect(transaction_info).to_not have_key(:credit_card_expiration_date)
    expect(transaction_info).to_not have_key(:created_at)
    expect(transaction_info).to_not have_key(:updated_at)
  end
end
