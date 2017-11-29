require 'rails_helper'

describe "Search Items using find_all and parameters" do

  xit "returns all items based on the status" do
    create_list(:item, 3)

    get "/api/v1/items/find_all?status=shipped"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)
    expect(items.count).to eq(3)
    expect(items[0][:customer_id]).to eq(1)
    expect(items[0][:merchant_id]).to eq(1)
    expect(items[2][:customer_id]).to eq(3)
    expect(items[2][:merchant_id]).to eq(3)

  end

  xit "returns all items based on the merchant_id" do
    create_list(:item, 3)

    get "/api/v1/items/find_all?id=1"
    expect(response).to be_success

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(1)
    expect(items[0][:customer_id]).to eq(4)
    expect(items[0][:merchant_id]).to eq(4)

  end

end
