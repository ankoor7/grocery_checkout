require 'spec_helper'

describe 'Checkout' do

  before :each do
    @checkout = Checkout.new
  end

  describe "#initialize" do
    it "creates a Checkout object" do
      expect(@checkout).to be_an_instance_of Checkout
    end
    it "creates has blank items array" do
      expect(@checkout.items).to be_an_instance_of Array
    end
  end

  describe "#scan" do
    before :each do
      @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
      @item2 = Item.new(name: "Loops", code: 'LP1', rrp: 100)
      @item3 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      @checkout.scan(@item3)
    end
    it "scan items to sell and puts them into a sorted array" do
      @items = [@item1, @item2, @item3].sort!  {|x,y| x.code <=> y.code }
      # the test is creating an array within an array for some reason. Therefore adding .first to remove outer array.
      expect(@checkout.items).to eql [@items].first
    end
    it "counts all items sold and returns a hash with items and number of each sold" do
      @checkout.summarise_items
      answer = [@item1=>2, @item2=>1]
      expect(@checkout.items_summary).to eql answer.first
    end
  end

  describe "#total" do
    before :each do
      @item1 = Item.new(name: "Fruit tea", code: 'FR1', rrp: 311)
      @item2 = Item.new(name: "Strawberries", code: 'SR1', rrp: 500)
      @item3 = Item.new(name: "Coffee", code: 'CF1', rrp: 1123)
      @offer1 = Bogof.new(item: @item1, quantity: 2, price: 311)
      @offer2 = Bulkbuy.new(item: @item2, quantity: 3, price: 450)
      @checkout = Checkout.new([@offer1, @offer2])

    end
    it "should total FR1, SR1, FR1, CF1 to 19.33" do
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      @checkout.scan(@item1)
      @checkout.scan(@item3)
      expect(@checkout.total).to eql 19.33
    end

    it "should total FR1, FR1 to 3.11" do
      @checkout.scan(@item1)
      @checkout.scan(@item1)
      expect(@checkout.total).to eql 3.11
    end

    it "should total SR1, SR1, FR1, SR1 to 16.61" do
      @checkout.scan(@item2)
      @checkout.scan(@item2)
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      expect(@checkout.total).to eql 16.61
    end

  end

end