# = checkout.rb
# Documentation for the file

# Documentation for the class.
# ---
#
# == Summary
# This models the checkout counter. Accpets items and calls offers to calculate the final total
class Checkout

attr_accessor :items, :items_summary

  def initialize
    @items = Array.new
    @items_summary = Hash.new
  end

  # Receive items to calculate and sort them
  def scan(item)
    @items.push item
    @items.sort!  {|x,y| x.code <=> y.code }
  end

  def summarise_items
    @items.uniq{|item| item.code}.each { |uniq_item|
      @items_summary[uniq_item.code] = @items.count{ |item| item.code == uniq_item.code}
    }
    @items_summary
  end


end
