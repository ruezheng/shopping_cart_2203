#   FINISHED
class ShoppingCart
  attr_reader :name, :products

  def initialize(store_name, num_items_string)
    @name = store_name
    @products = []
    @num_items_string = num_items_string
  end

  def capacity
    @num_items_string.gsub("items","").to_i
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

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity
    end
    total
  end

  def is_full?
    total_number_of_products >= capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

#   ITERATION 4

  def percentage_occupied
    ((total_number_of_products / capacity.to_f) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end.reverse
  end

  def product_breakdown
    breakdown_hash = {}
    @products.each do |product|
      breakdown_hash[product.category] = products_by_category(product.category)
    end
    breakdown_hash
  end
end
