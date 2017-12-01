class Api::V1::Merchants::RevenueController < ApplicationController

  def show

    if params[:date]
      render json: Merchant.date_total_merchant_revenue(params[:id], params[:date]), serializer: RevenueSerializer
    else
      render json: Merchant.total_merchant_revenue(params[:id]), serializer: RevenueSerializer
    end

  end

end
