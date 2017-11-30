class Api::V1::Merchants::ItemController < ApplicationController

  def index
    render json: Item.where(merchant_id: params[:id])
  end

end
