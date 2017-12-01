class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItem.where(search_params)
  end

  def show
    # byebug
    render json: InvoiceItem.find_by(search_params)
  end

private

  def search_params

    params[:unit_price] = (params[:unit_price].to_f * 100).to_i if params[:unit_price]
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
