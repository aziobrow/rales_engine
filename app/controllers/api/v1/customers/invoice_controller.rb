class Api::V1::Customers::InvoiceController < ApplicationController

  def index
    render json: Invoice.where(customer_id: params[:id])
  end

end
