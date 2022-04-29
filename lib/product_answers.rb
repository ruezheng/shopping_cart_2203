#   FINISHED
class Product
  attr_reader :category, :name, :unit_price

  def initialize(category, name, unit_price, quantity_string)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity_string = quantity_string
    @hoarding_status = false
  end

  def quantity
    @quantity_string.to_i
  end

  def total_price
      @unit_price * quantity
  end

  def is_hoarded?
    @hoarding_status
  end

  def hoard
    @hoarding_status = true
  end

end
