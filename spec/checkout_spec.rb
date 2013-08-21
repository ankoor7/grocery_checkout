require 'spec_helper'

describe 'Checkout' do

  before :each do
    @checkout = Checkout.new
  end

  describe "#new" do
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
    end

    it "scan items to sell and puts them into a sorted array" do
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      @checkout.scan(@item3)
      @items = [@item1, @item2, @item3].sort!  {|x,y| x.code <=> y.code }
      # the test is creating an array within an array for some reason. Therefore adding .first to remove outer array.
      expect(@checkout.items).to eql [@items].first
    end

    it "counts all items sold and returns a hash with items and number of each sold" do
      @checkout.scan(@item1)
      @checkout.scan(@item2)
      @checkout.scan(@item3)
      @checkout.summarise_items
      answer = ["FR1"=>2, "LP1"=>1]
      expect(@checkout.items_summary).to eql answer.first
    end

  end

end