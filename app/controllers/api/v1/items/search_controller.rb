class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.find_by(search_params)
  end

private

  def search_params
    params[:unit_price] = (params[:unit_price].to_f * 100).round(1).to_i if params[:unit_price]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
