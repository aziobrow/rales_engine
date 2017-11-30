require 'rails_helper'

describe "Search Invoice Items using random" do

  it "returns an invoice based on a random selection" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/random"
    expect(response).to be_success

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_item).to have_key(:id)
    expect(invoice_item).to have_key(:item_id)
    expect(invoice_item).to have_key(:invoice_id)
    expect(invoice_item).to have_key(:unit_price)
    expect(invoice_item).to have_key(:quantity)
    expect(invoice_item).to have_key(:unit_price)
  end

end
