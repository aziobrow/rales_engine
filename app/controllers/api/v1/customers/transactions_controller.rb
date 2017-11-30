class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    byebug
    render json: Customer.find(params[:id]).transactions
  end

end
