class Merchant < ApplicationRecord

  def self.parse_params(params)
    if params[:id]
      Merchant.find(params[:id].to_i)
    elsif params[:name]
      Merchant.find_by(name: params[:name])
    elsif params[:created_at]
      Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Merchant.find_by(updated_at: params[:created_at])
    end
  end


end
