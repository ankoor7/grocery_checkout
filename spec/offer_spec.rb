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



end


describe 'Bulkbuy' do

  before :each do
    @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
    # Bogof offer for 3 for the price of 2
    @offer = Bulkbuy.new(item: @item1, quantity: 3, price: 400)
  end

  describe "#initialize" do
    it "should create an offer object" do
      expect(@offer).to be_an_instance_of Bulkbuy
    end

    it "should hold the passed variables defining the offer" do
      answer = @item1, 3, 400
      expect([@offer.item, @offer.quantity, @offer.price]).to eql answer
    end

  end



end