class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def create
    render json: Merchant.create(merchant_params)
  end

  def show
    if params[:id] == "find"
      redirect_to "/api/v1/merchants/search_controller"
    else
      render json: Merchant.find(params[:id])
    end
  end

  private
    def merchant_params
      params.require(:merchant).permit(:name)
    end
end
