require 'rails_helper'

describe "Search Items using find_all and parameters" do
  before do
    merchant = create(:merchant)
    @item_1 = create(:item, name: "Bouncy Ball", description: "Fun!", merchant_id: merchant.id)
    @item_2 = create(:item, description: "Fun!", merchant_id: merchant.id)
    @item_3 = create(:item, name: "Bouncy Ball")
    @item_4 = create(:item, description: "Fun!")
  end


  it "returns all items based on the id" do

    get "/api/v1/items/find_all?id=#{@item_1.id}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(@item_1.id)


  end

  it "returns all items based on the name" do

    get "/api/v1/items/find_all?name=#{@item_3.name}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(2)
    expect(items[0][:id]).to eq(@item_1.id)
    expect(items[1][:id]).to eq(@item_3.id)
  end

  it "returns all items based on the description" do

    get "/api/v1/items/find_all?description=#{@item_2.description}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(3)
    expect(items[0][:id]).to eq(@item_1.id)
    expect(items[1][:id]).to eq(@item_2.id)
    expect(items[2][:id]).to eq(@item_4.id)
  end


  it "returns all items based on the unit_price" do

    get "/api/v1/items/find_all?unit_price=#{@item_3.unit_price}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(4)
    expect(items[0][:id]).to eq(@item_1.id)
    expect(items[1][:id]).to eq(@item_2.id)
    expect(items[2][:id]).to eq(@item_3.id)
    expect(items[3][:id]).to eq(@item_4.id)

  end

  it "returns all items based on the merchant_id" do

    get "/api/v1/items/find_all?merchant_id=#{@item_1.merchant_id}"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)
    expect(items.count).to eq(2)
    expect(items[0][:id]).to eq(@item_1.id)
    expect(items[1][:id]).to eq(@item_2.id)

  end

  xit "returns all items based on the created_at date time" do

    get "/api/v1/items/find_all?created_at=#{@item_1.created_at}"

    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[0][:id]).to eq(@item.id)

  end
end
