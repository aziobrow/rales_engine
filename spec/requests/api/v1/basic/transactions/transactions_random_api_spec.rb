require 'rails_helper'

describe "Transactions Find API" do
  before do
    create_list(:transaction, 3)
    @transaction = Transaction.first
    @second_transaction = Transaction.second
    @last_transaction = Transaction.last
  end

  it "finds by id" do
    get "/api/v1/transactions/random"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_key(:id)
    expect(transaction_info).to have_key(:invoice_id)
    expect(transaction_info).to have_key(:result)

  end


end
