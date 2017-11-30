class Api::V1::Merchants::InvoiceController < ApplicationController

  def index
    render json: Invoice.where(merchant_id: params[:id])
  end

end
