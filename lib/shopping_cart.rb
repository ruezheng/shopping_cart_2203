class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity_string)
    @name = name
    @capacity_string = capacity_string
    @products = []
  end

  def capacity
    @capacity_string.gsub("items","").to_i
  end

  def add_product(product)
    @products << product
  end

  def details
    {
      name: @name,
      capacity: capacity
    }
  end
end
