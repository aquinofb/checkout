require 'spec_helper'

module Checkout
  RSpec.describe Basket do
    let(:product_1) { Product.new(1, 'Lavender heart', 925) }
    let(:product_2) { Product.new(2, 'Personalised cufflinks', 4500) }
    let(:product_3) { Product.new(3, 'Kids T-shirt', 1995) }

    describe '#scan' do
      let(:basket) { Basket.new }

      context 'when the product was not added yet' do
        it 'create a item with that product and add to items' do
          basket.scan(product_1)
          basket.scan(product_2)
          basket.scan(product_3)
          expect(basket.send(:items).size).to eq(3)
        end
      end

      context 'when the product was already added' do
        before do
          10.times {
            basket.scan(product_1)
          }
        end

        it 'increment the item with the product given' do
          expect(basket.send(:items).size).to eq(1)
        end
      end
    end

    describe '#total' do
      context 'when have promotions' do
        context 'when satisfy the promotion' do
          let(:promo)   { Promotional::PercentOff.new(6000, 10) }
          let(:basket)  { Basket.new([promo]) }

          before do
            basket.scan(product_1)
            basket.scan(product_2)
            basket.scan(product_3)
          end

          it 'returns the sum of the total of all the items and apply the promo discount' do
            expect(basket.total).to eq('£66.78')
          end
        end

        context 'when do not satisfy the promotion' do
          let(:promo)   { Promotional::PercentOff.new(8000, 10) }
          let(:basket)  { Basket.new([promo]) }

          before do
            basket.scan(product_1)
            basket.scan(product_2)
            basket.scan(product_3)
          end

          it 'returns the sum of the total of all the items and apply the promo discount' do
            expect(basket.total).to eq('£74.20')
          end
        end
      end

      context 'when do not have promotions' do
        let(:basket)  { Basket.new }

        before do
          basket.scan(product_1)
          basket.scan(product_2)
          basket.scan(product_3)
        end

        it 'returns the sum of the totals of the items' do
          expect(basket.total).to eq('£74.20')
        end
      end
    end
  end
end
