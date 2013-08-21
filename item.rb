# = item.rb
# Documentation for the file

# Documentation for the class.
# ---

# == Summary
# Items have a name, an item code and the recommend retail price, rrp. Use this as the default price
class Item

attr_accessor :name, :code, :rrp

  def initialize(options)
    @rrp = options[:rrp]
    @code = options[:code]
    @name = options[:name]
  end

end