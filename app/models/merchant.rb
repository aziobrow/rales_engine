class Merchant < ApplicationRecord
  #
  # def self.extract_query(request)
  #   url    = request.fullpath
  #   uri    = URI.parse(url)
  #   params = CGI.parse(uri.query)
  # end

  def self.parse_index_params(params)
    url    = request.fullpath
    uri    = URI.parse(url)
    params = CGI.parse(uri.query)

    if params[:name]
      render json: Merchant.where(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.where(updated_at: params[:updated_at])
    else
      render json: Merchant.all
    end
  end

  def self.parse_show_params(params)
    url    = request.fullpath
    uri    = URI.parse(url)
    params = CGI.parse(uri.query)
    
    if params[:name]
      render json: Merchant.find_by(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.find_by(updated_at: params[:updated_at])
    else
      render json: Merchant.find(params[:id])
    end
  end

end
