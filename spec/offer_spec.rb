require 'spec_helper'

describe 'Offer' do

  before :each do
    @offer = Offer.new
  end

  describe "#new" do
    it "should create an offer object" do
      expect(@offer).to be_an_instance_of Offer
    end
  end
end