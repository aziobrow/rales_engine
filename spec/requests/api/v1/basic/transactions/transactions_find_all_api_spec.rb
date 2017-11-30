require 'rails_helper'

describe "Transactions Find All API" do
  before do
    @transaction = create(:transaction, invoice_id: 1, updated_at: Time.now)
    @second_transaction = create(:transaction, invoice_id: 1, result: "failed", created_at: @transaction.updated_at)
    @last_transaction = create(:transaction, created_at: @transaction.updated_at)
  end

  it "finds all by id" do
    get "/api/v1/transactions/find_all?id=#{@transaction.id}"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(1)
    expect(transactions.first).to have_value(@transaction.id)
  end

  it "finds all by invoice_id" do
    get "/api/v1/transactions/find_all?invoice_id=#{@transaction.invoice_id}"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions.first).to have_value(@transaction.id)
    expect(transactions.second).to have_value(@second_transaction.id)
  end

  it "finds all by result" do
    get "/api/v1/transactions/find_all?result=#{@transaction.result}"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions.first).to have_value(@transaction.id)
    expect(transactions.second).to have_value(@last_transaction.id)
  end

  xit "finds all by created at date" do
    get "/api/v1/transactions/find_all?created_at=#{@second_transaction.created_at}"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
    expect(transactions.first).to have_value(@second_transaction.id)
    expect(transactions.second).to have_value(@last_transaction.id)
  end

  xit "finds all by updated at date" do
    get "/api/v1/transactions/find_all?updated_at=#{@transaction.updated_at}"
    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(transactions.count).to eq(1)
    expect(transactions.first).to have_value(@transaction.id)
  end
end
