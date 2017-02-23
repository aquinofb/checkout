require 'spec_helper'

module Checkout
  RSpec.describe Item do
    let(:product) { Product.new(1, 'Lavender', 970) }
    let(:item)    { Item.new(product) }

    describe '#increment!' do
      it 'increment the quantity of products' do
        expect(item.qnt).to eq(1)
        item.increment!
        expect(item.qnt).to eq(2)
        item.increment!
        expect(item.qnt).to eq(3)
      end
    end

    describe '#product_price' do
      it 'returns the price of the product' do
        expect(item.product_price).to eq(product.price)
      end
    end

    describe '#product_code' do
      it 'returns the code of the product' do
        expect(item.product_code).to eq(product.code)
      end
    end

    describe '#total' do
      it 'returns the total price' do
        expect(item.total).to eq(product.price)
      end
    end
  end
end
