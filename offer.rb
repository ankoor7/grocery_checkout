# = =offer.rb
# Documentation for the file
# The classes hold special pricing models for specific items. There are classes for different types of offer. They take an item, the number of a that item to sell and return the cost for the entire group.

# Documentation for the Bogof Class
# ---

# Summary
# Initializer for each offer class
class Offer

  attr_accessor :item, :quantity, :price, :date

  def initialize(options)
    @item = options[:item]
    @quantity = options[:quantity]
    @price = options[:price]
    @date = options[:date] || Date.today
  end

end


# Documentation for the Bogof Class
# ---

# Summary
class Bogof < Offer

  def calculate(quantity_sold)
    cost = 0
    while quantity_sold >= @quantity
      cost += @price
      quantity_sold -= @quantity
    end
    cost += @item.rrp * quantity_sold
    return cost
  end
end


# Documentation for the Bulkbuy Class
# ---

# Summary
class Bulkbuy < Offer

  def calculate(quantity_sold)
    cost = quantity_sold >= @quantity ? quantity_sold * @price : quantity_sold * @item.rrp
  end

end