class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: Merchant.parse_index_params(params)
  end

  def show
    render json: Merchant.parse_show_params(params)
  end
end
