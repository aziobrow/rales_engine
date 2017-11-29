require 'rails_helper'

describe "Search Items using find and parameters" do

  it "returns an item based on a random selection" do
    create_list(:item, 3)

    get "/api/v1/items/random"
    expect(response).to be_success

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

end
