class Item

attr_accessor :name, :code, :rrp

  def initialize(options)
    @rrp = options[:rrp]
    @code = options[:code]
    @name = options[:name]
  end

end