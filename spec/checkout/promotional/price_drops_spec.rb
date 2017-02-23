require 'spec_helper'

module Checkout
  module Promotional
    RSpec.describe PriceDrops do
      let(:product_1) { Product.new(1, 'Lavender heart', 925) }
      let(:product_2) { Product.new(2, 'Personalised cufflinks', 4500) }
      let(:product_3) { Product.new(3, 'Kids T-shirt', 1995) }

      let(:item_1) { Item.new(product_1) }
      let(:item_2) { Item.new(product_2) }
      let(:item_3) { Item.new(product_3) }

      let(:item_collection) { ItemCollection.new([item_1, item_2, item_3]) }

      let(:promo) { PriceDrops.new(2, 2, 4000) }

      describe '#apply' do
        context 'when the product of the promotion was added once' do
          it 'returns 0' do
            discount = promo.apply(item_collection)
            expect(discount).to eq(0)
          end
        end

        context 'when the product of the promotion was added twice' do
          it 'returns the discount related to the promotion' do
            item_2.increment!
            discount = promo.apply(item_collection)
            expect(discount).to eq(1000)
          end
        end
      end
    end
  end
end
