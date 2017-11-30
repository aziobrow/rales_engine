class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    render json: Transaction.customer_transactions
  end

end
