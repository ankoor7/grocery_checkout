# = checkout.rb
# Documentation for the file

# Documentation for the class.
# ---
#
# == Summary
# This models the checkout counter. Accpets items and calls offers to calculate the final total
class Checkout

attr_accessor :items, :items_summary

  def initialize(offers = [])
    @items = Array.new
    @items_summary = Hash.new
    @offers = offers
  end

  # Receive items to calculate and sort them
  def scan(item)
    @items.push item
    @items.sort!  {|x,y| x.code <=> y.code }
  end

  def summarise_items
    @items.uniq{|item| item.code}.each { |uniq_item|
      @items_summary[uniq_item] = @items.count{ |item| item.code == uniq_item.code }
    }
    @items_summary
  end

  def total
    summarise_items

    item_codes_on_offer = []
    @offers.each { |offer|
      item_codes_on_offer << offer.item.code
    }

    items_on_offer = @items_summary.select! { |item, quantity|
      item_codes_on_offer.include? item.code
    }

    total_cost = 0

    items_on_offer.each { |item, quantity|
      @offers.each { |offer|
        if offer.item.code == item.code
          total_cost += offer.calculate(quantity)
        end
      }
    }

    @items_summary.each { |item, quantity|
      total_cost += item.rrp * quantity
    }

    return total_cost.to_f/100
  end


end
