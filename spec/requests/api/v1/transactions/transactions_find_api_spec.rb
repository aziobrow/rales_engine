require 'rails_helper'

describe "Transactions Find API" do
  before do
    create_list(:transaction, 3)
    @transaction = Transaction.first
    @second_transaction = Transaction.second
    @last_transaction = Transaction.last
  end

  it "finds by id" do
    get "/api/v1/transactions/find?id=#{@transaction.id}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_key(:id)
    expect(transaction_info).to have_key(:invoice_id)
    expect(transaction_info).to have_key(:result)
    expect(transaction_info).to have_value(@transaction.id)
    expect(transaction_info).to have_value(@transaction.invoice_id)
    expect(transaction_info).to have_value(@transaction.result)
    expect(transaction_info).to_not have_value(@last_transaction.id)
    expect(transaction_info).to_not have_value(@second_transaction.id)
  end

  it "finds by invoice_id" do
    get "/api/v1/transactions/find?invoice_id=#{@last_transaction.invoice_id}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_value(@last_transaction.id)
    expect(transaction_info).to have_value(@last_transaction.invoice_id)
    expect(transaction_info).to have_value(@last_transaction.result)
    expect(transaction_info).to_not have_value(@transaction.id)
    expect(transaction_info).to_not have_value(@second_transaction.id)
  end

  it "finds by result" do
    get "/api/v1/transactions/find?result=#{@transaction.result}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_value(@transaction.id)
    expect(transaction_info).to have_value(@transaction.invoice_id)
    expect(transaction_info).to have_value(@transaction.result)
    expect(transaction_info).to_not have_value(@second_transaction.id)
    expect(transaction_info).to_not have_value(@last_transaction.id)
  end

  xit "finds by created at date" do
    get "/api/v1/transactions/find?created_at=#{@second_transaction.created_at}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_value(@second_transaction.id)
    expect(transaction_info).to have_value(@second_transaction.invoice_id)
    expect(transaction_info).to have_value(@second_transaction.result)
    expect(transaction_info).to_not have_value(@last_transaction.id)
    expect(transaction_info).to_not have_value(@second_transaction.id)
  end

  xit "finds by updated at date" do
    get "/api/v1/transactions/find?updated_at=#{@last_transaction.updated_at}"
    transaction_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transaction_info).to have_value(@last_transaction.id)
    expect(transaction_info).to have_value(@last_transaction.invoice_id)
    expect(transaction_info).to have_value(@last_transaction.result)
    expect(transaction_info).to_not have_value(@transaction.id)
    expect(transaction_info).to_not have_value(@second_transaction.id)
  end
end
