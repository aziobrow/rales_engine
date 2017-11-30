require 'rails_helper'

describe "Search Items using find_all and parameters" do
  before do
    create_list(:item, 3)
    @item = Item.last
  end


  it "returns an item based on the id" do

    get "/api/v1/items/find_all?id=#{@item.id}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(3)
    expect(items[0][:name]).to eq("Name3")
    expect(items[0][:description]).to eq("Description for Item Name3")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(3)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

    # expect(items[2][:id]).to eq(1)
    # expect(items[2][:name]).to eq("Name1")
    # expect(items[2][:description]).to eq("Description for Item Name")
    # expect(items[2][:unit_price]).to eq(100)
    # expect(items[2][:merchant_id]).to eq(1)
    # expect(items[2]).to_not have_key(:created_at)
    # expect(items[2]).to_not have_key(:updated_at)

  end

  it "returns an item based on the name" do

    get "/api/v1/items/find_all?name=#{@item.name}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(1)
    expect(items[0][:name]).to eq("Name4")
    expect(items[0][:description]).to eq("Description for Item Name4")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(4)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

  end
  it "returns an item based on the description" do

    get "/api/v1/items/find_all?description=#{@item.description}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(1)
    expect(items[0][:name]).to eq("Name7")
    expect(items[0][:description]).to eq("Description for Item Name7")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(7)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

  end
  it "returns an item based on the unit_price" do

    get "/api/v1/items/find_all?unit_price=#{@item.unit_price}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(1)
    expect(items[0][:name]).to eq("Name10")
    expect(items[0][:description]).to eq("Description for Item Name10")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(10)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

    expect(items[2][:id]).to eq(3)
    expect(items[2][:name]).to eq("Name12")
    expect(items[2][:description]).to eq("Description for Item Name12")
    expect(items[2][:unit_price]).to eq(100)
    expect(items[2][:merchant_id]).to eq(12)
    expect(items[2]).to_not have_key(:created_at)
    expect(items[2]).to_not have_key(:updated_at)

  end
  it "returns an item based on the merchant_id" do

    get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(3)
    expect(items[0][:name]).to eq("Name15")
    expect(items[0][:description]).to eq("Description for Item Name15")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(15)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

  end

  xit "returns an item based on the created_at date time" do

    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(3)
    expect(items[0][:name]).to eq("Name")
    expect(items[0][:description]).to eq("Description for Item Name")
    expect(items[0][:unit_price]).to eq(100)
    expect(items[0][:merchant_id]).to eq(3)
    expect(items[0]).to_not have_key(:created_at)
    expect(items[0]).to_not have_key(:updated_at)

  end
end
