require 'rails_helper'

describe "Search Items using find and parameters" do

  xit "returns an item based on a random selection" do
    create_list(:item, 3)
    @item = Item.last

    get "/api/v1/items/random"
    expect(response).to be_success

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:status)
    expect(item).to have_key(:merchant_id)
    expect(item).to have_key(:customer_id)
  end

end
