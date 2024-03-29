require 'spec_helper'


describe 'Offer' do
  before :each do
    @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
    # Bogof offer for 3 for the price of 2
    @offer = Offer.new(item: @item1, quantity: 3, price: 400)
  end

  describe "#initialize" do
    it "should create an Offer object" do
      expect(@offer).to be_an_instance_of Offer
    end
    it "should hold the passed variables defining the offer" do
      answer = @item1, 3, 400
      expect([@offer.item, @offer.quantity, @offer.price]).to eql answer
    end
  end

end

describe 'Bogof' do

  before :each do
    @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
    # Bogof offer for 3 for the price of 2
    @offer = Bogof.new(item: @item1, quantity: 3, price: 400)
  end

  describe "#initialize" do
    it "should create a Bogof object" do
      expect(@offer).to be_an_instance_of Bogof
    end
    it "should hold the passed variables defining the offer" do
      answer = @item1, 3, 400
      expect([@offer.item, @offer.quantity, @offer.price]).to eql answer
    end
  end

  describe "#calculate" do
    it "should calculate the cost of items on offer and return a cost" do
      expect(@offer.calculate(6)).to eql 800
    end
    it "should calculate account for left over items and charge the default price " do
      expect(@offer.calculate(7)).to eql 1000
    end
  end

end


describe 'Bulkbuy' do

  before :each do
    @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
    # Bogof offer for 3 for the price of 2
    @offer = Bulkbuy.new(item: @item1, quantity: 4, price: 150)
  end

  describe "#initialize" do
    it "should create an offer object" do
      expect(@offer).to be_an_instance_of Bulkbuy
    end
    it "should hold the passed variables defining the offer" do
      answer = @item1, 4, 150
      expect([@offer.item, @offer.quantity, @offer.price]).to eql answer
    end

  end

  describe "#calculate" do
    it "should calculate the cost of items on a bulkbuy offer and return a cost" do
      expect(@offer.calculate(3)).to eql 600
    end
    it "should calculate account for left over items and charge the default price " do
      expect(@offer.calculate(4)).to eql 600
    end
    it "should calculate account for left over items and charge the default price " do
      expect(@offer.calculate(5)).to eql 750
    end
  end

end