require 'rails_helper'

describe "Items API" do

  it "renders a list of items" do

    create_list(:item, 3)
    get "/api/v1/items"

    items = JSON.parse(response.body, symbolize_names: true)
    item = items.first

    expect(response).to be_success

    expect(items.count).to eq(3)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)

  end

  it "renders a single item" do

    create_list(:item, 3)
    id = Item.last.id
    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)
    # byebug

    expect(response).to be_success

    expect(item[1]).to eq(nil)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:unit_price)
    expect(item).to have_key(:merchant_id)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)

  end

end
