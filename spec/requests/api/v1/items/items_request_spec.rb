require 'rails_helper'

describe "Items API" do

  it "renders a list of items" do

    create_list(:items, 3)
    get "/api/v1/items"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
  end

end
# id,name,description,unit_price,merchant_id,created_at,updated_at
# require 'rails_helper'
#
# describe "Invoices API" do
#   it "returns a list of invoices" do
#     create_list(:invoice, 3)
#
#     get '/api/v1/invoices'
#
#     invoices = JSON.parse(response.body, symbolize_names: true)
#     invoice = invoices.first
#
#     expect(response).to be_success
#     expect(invoices.count).to eq(3)
#     expect(invoice).to have_key(:id)
#     expect(invoice).to have_key(:status)
#     expect(invoice).to have_key(:customer_id)
#
#   end
#
#   it "returns values for a single invoice" do
#     create_list(:invoice, 3)
#     id = Invoice.last.id
#
#     get "/api/v1/invoices/#{id}"
#
#     invoice = JSON.parse(response.body, symbolize_names: true)
#
#     expect(response).to be_success
#     expect(invoice).to have_key(:id)
#     expect(invoice).to have_key(:status)
#     expect(invoice).to have_key(:customer_id)
#   end
# end
