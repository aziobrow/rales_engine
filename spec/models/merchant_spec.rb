require 'rails_helper'

describe Merchant do

  describe "relationships" do
    it "has_many items" do
      merchant = create(:merchant)
      items = create_list(:item, 3, merchant: merchant)
      expect(merchant.items).to eq(items)
    end
    it "has_many invoices" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 3, merchant: merchant)
      expect(merchant.invoices).to eq(invoices)
    end
  end
end


describe "Active Record Methods" do
  it "returns the merchants with the most items" do

    items = create_list(:item, 7)

    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)

    merchant_1.items << items[0]
    merchant_2.items << items[1..4]
    merchant_3.items << items[5..6]

    expect(Merchant.most_items(2)).to eq([merchant_2, merchant_3])

  end
end
