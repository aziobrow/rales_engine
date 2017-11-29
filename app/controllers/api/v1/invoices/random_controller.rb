class Api::V1::Invoices::RandomController < ApplicationController

  def show
    random_id = (1..Invoice.count).to_a.sample
    render json: Invoice.find(random_id)
  end

end
