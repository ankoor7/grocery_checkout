require 'spec_helper'

describe 'Checkout' do

  before :each do
    @checkout = Checkout.new
  end

  describe "#new" do
    it "creates a Checkout object" do
      expect(@checkout).to be_an_instance_of Checkout
    end
  end


end