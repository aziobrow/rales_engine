class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    render json: Item.most_revenue_items(search_params[:quantity])
  end

private

  def search_params
    params.permit(:quantity)
  end
end
