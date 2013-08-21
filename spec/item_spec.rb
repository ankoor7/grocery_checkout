require 'spec_helper'
require 'pry'

describe 'Item' do

  before :each do
    @item1 = Item.new(name: "Fruit", code: 'FR1', rrp: 200)
    @item2 = Item.new(name: "Loops", code: 'LP1', rrp: 100)
  end

  describe "#new" do
    it "creates an Item object" do
      expect(@item1).to be_an_instance_of Item
    end

    it "takes an options hash and assigns the values" do
      actual_value = [@item1.name, @item1.code, @item1.rrp]
      correct_answer = ["Fruit", 'FR1', 200]
      expect(actual_value).to eql correct_answer
    end
  end

end