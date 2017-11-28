class Api::V1::Merchants::SearchController < ApplicationController
  def index
    if params[:name]
      render json: Merchant.where(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.where(updated_at: params[:created_at])
    end
  end

  def show
    render json: Merchant.parse_params(params)
  end
end
