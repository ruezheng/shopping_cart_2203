#   FINISHED
require 'pry'
require 'rspec'
require './lib/product'
require './shopping_cart'

describe ShoppingCart do
  it "exists" do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart).to be_an_instance_of ShoppingCart
  end

  it "has attributes" do
    cart = ShoppingCart.new("King Soopers", "30items")

    expect(cart.name).to eq "King Soopers"
    expect(cart.capacity).to eq 30
    expect(cart.products).to eq []
  end

  it "can add products to the cart" do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')

    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products).to eq [product1, product2]
  end

  it "can return a detailed hash of name and capacity" do
    cart = ShoppingCart.new("King Soopers", "30items")
    expected_hash = {name: "King Soopers", capacity: 30}

    expect(cart.details).to eq expected_hash
  end

  it "can return the total number of products in the cart" do
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_of_products).to eq 13

    cart.add_product(product4)

    expect(cart.total_number_of_products).to eq 33
  end

  it "can tell us if the cart if full or not" do

    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    product5 = Product.new(:produce, 'bananas', 0.99, '3')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.is_full?).to eq false

    cart.add_product(product4)

    expect(cart.is_full?).to eq true

    cart.add_product(product5)

    expect(cart.is_full?).to eq true
  end

  it "can return products by category" do

    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.products_by_category(:paper)).to eq [product1,product3]
  end

#   ITERATION 4

  it "can return percentage occupied of cart" do

    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.percentage_occupied).to eq 43.33
  end

  it "can return products in order from greatest to least quantity" do

    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.sorted_products_by_quantity).to eq [product4, product1,product2,product3]
  end

  it "can breakdown products in each category" do

    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')

    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expected_hash = {
      meat: [product2],
      paper: [product1,product3],
      produce: [product4]
    }

    expect(cart.product_breakdown).to eq expected_hash
  end
end
