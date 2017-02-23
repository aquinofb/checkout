module Checkout
  class Item
    attr_reader :qnt

    def initialize(product, qnt = 1)
      @product, @qnt = product, qnt
    end

    def increment!(value = 1)
      @qnt += value
    end

    def product_price
      product.price
    end

    def product_code
      product.code
    end

    def total
      product.price * qnt
    end

    private
      attr_reader :product
  end
end 
