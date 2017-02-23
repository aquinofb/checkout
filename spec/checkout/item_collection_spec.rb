require 'spec_helper'

module Checkout
  RSpec.describe ItemCollection do
    let(:product_1) { Product.new(1, 'Lavender heart', 925) }
    let(:product_2) { Product.new(2, 'Personalised cufflinks', 4500) }
    let(:product_3) { Product.new(3, 'Kids T-shirt', 1995) }
    let(:product_4) { Product.new(4, 'Adult T-shirt', 1987) }

    let(:item_1) { Item.new(product_1) }
    let(:item_2) { Item.new(product_2) }
    let(:item_3) { Item.new(product_3) }
    let(:item_4) { Item.new(product_4) }

    let(:item_collection) { ItemCollection.new([item_1, item_2, item_3]) }

    describe '#<<' do
      it 'push a new item' do
        item_collection << item_4
        expect(item_collection.send(:items)).to match_array([item_1, item_2, item_3, item_4])
      end
    end

    describe '#find_by_product' do
      context 'when have product with the given code' do
        it 'returns the item' do
          returned_item = item_collection.find_by_product(product_2.code)
          expect(returned_item).to eq(item_2)
        end
      end

      context 'when have no product with the given code' do
        it 'returns nil' do
          returned_item = item_collection.find_by_product(product_4.code)
          expect(returned_item).to be_nil
        end
      end
    end

    describe '#total' do
      it 'returns to sum of the totals of all items' do
        expect(item_collection.total).to eq([item_1.total, item_2.total, item_3.total].inject(:+))
      end
    end

    describe '#size' do
      it 'returns to number of items' do
        expect(item_collection.size).to eq(3)
      end
    end
  end
end
