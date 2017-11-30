class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    render json: Invoice.where(merchant_id: params[:id])
  end

end
