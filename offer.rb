# = =offer.rb
# Documentation for the file
# The classes hold special pricing models for specific items. There are classes for different types of offer. They take an item, the number of a that item to sell and return the cost for the entire group.

# Documentation for the Bogof Class
# ---

# Summary
class Bogof

attr_accessor :item, :quantity, :price

  def initialize(options)
    @item = options[:item]
    @quantity = options[:quantity]
    @price = options[:price]
  end

  def calculate(item, quantity)

  end
end


# Documentation for the Bulkbuy Class
# ---

# Summary
class Bulkbuy

attr_accessor :item, :quantity, :price

  def initialize(options)
    @item = options[:item]
    @quantity = options[:quantity]
    @price = options[:price]
  end

  def calculate(item, quantity)

  end


end