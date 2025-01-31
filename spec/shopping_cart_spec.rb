require 'pry'
require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  describe 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_a(ShoppingCart)
    end

    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq("King Soopers")
      expect(cart.capacity).to eq(30)
    end

    it 'starts with no products' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.products).to eq([])
    end

    it 'can add products to the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')

      cart.add_product(product_1)
      cart.add_product(product_2)

      expect(cart.products).to eq([product_1, product_2])
    end

    it 'creates a hash of cart details' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.details).to eq({name: 'King Soopers', capacity: 30})
    end
  end

  describe "Iteration 3" do
    it 'can check the total number of products' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.total_number_of_products).to eq(13)
    end

    it 'can check if the cart is full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.is_full?).to eq false
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)
      expect(cart.is_full?).to eq true
    end

    it 'can list products by category' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)
      expect(cart.products_by_category(:paper)).to include(product_1, product_3)
    end
  end

  describe 'Iteration 4' do
    it 'can calculate the percent full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product_2 = Product.new(:meat, 'chicken', 4.50, '2')
      product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      cart.add_product(product_1)
      cart.add_product(product_2)
      cart.add_product(product_3)

      expect(cart.percentage_occupied).to eq(43.33)
    end

  #   it 'can sort products by quanitiy' do
  #     cart = ShoppingCart.new("King Soopers", "30items")
  #     product_1 = Product.new(:paper, 'toilet paper', 3.70, '10')
  #     product_2 = Product.new(:meat, 'chicken', 4.50, '2')
  #     product_3 = Product.new(:paper, 'tissue paper', 1.25, '1')
  #     product4 = Product.new(:produce, 'apples', 0.99, '20')
  #     cart.add_product(product_1)
  #     cart.add_product(product_2)
  #     cart.add_product(product_3)
  #     cart.add_product(product4)

  #     expect(cart.sort_products_by_quanity[0]).to eq(product4)
  #   end
  end
end