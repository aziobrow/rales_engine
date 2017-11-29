require 'rails_helper'

describe "Search Items using find and parameters" do
  before do
    create_list(:item, 3)
    @item = Item.last
  end


  it "returns an item based on the id" do

    get "/api/v1/items/find?id=#{@item.id}"
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

  it "returns an item based on the name" do

    get "/api/v1/items/find?name=#{@item.name}"
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
  it "returns an item based on the description" do

    get "/api/v1/items/find?description=#{@item.description}"
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
  it "returns an item based on the unit_price" do

    get "/api/v1/items/find?unit_price=#{@item.unit_price}"
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
  it "returns an item based on the merchant_id" do

    get "/api/v1/items/find?merchant_id=#{@item.merchant_id}"
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

  xit "returns an item based on the created_at date time" do

    get "/api/v1/items/find?created_at=#{@item.created_at}"

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
