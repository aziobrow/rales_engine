class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    invoices = Merchant.find(params[:id]).invoices

    if params[:date]
      render json: invoices.date_total_merchant_revenue(params[:date])
    else
      render json: invoices.total_merchant_revenue
    end

  end

end
