require 'spec_helper'

module Checkout
  module Promotional
    RSpec.describe PercentOff do
      let(:product_1) { Product.new(1, 'Lavender heart', 1000) }
      let(:product_2) { Product.new(2, 'Personalised cufflinks', 1000) }
      let(:product_3) { Product.new(3, 'Kids T-shirt', 1000) }

      let(:item_1) { Item.new(product_1) }
      let(:item_2) { Item.new(product_2) }
      let(:item_3) { Item.new(product_3) }

      let(:item_collection) { ItemCollection.new([item_1, item_2, item_3]) }

      let(:promo) { PercentOff.new(4000, 10) }

      describe '#apply' do
        context 'when the promotion wasn\'t satisfied' do
          it 'returns 0' do
            discount = promo.apply(item_collection)
            expect(discount).to eq(0)
          end
        end

        context 'when the promotion wasn satisfied' do
          it 'returns the discount related to the promotion' do
            item_2.increment!(2)
            discount = promo.apply(item_collection)
            expect(discount).to eq(500)
          end
        end
      end
    end
  end
end
