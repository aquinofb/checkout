require "spec_helper"

RSpec.describe Checkout do
  let(:product_1)   { Checkout::Product.new(1, 'Lavender heart', 925) }
  let(:product_2)   { Checkout::Product.new(2, 'Personalised cufflinks', 4500) }
  let(:product_3)   { Checkout::Product.new(3, 'Kids T-shirt', 1995) }

  let(:percent_off) { Checkout::Promotional::PercentOff.new(6000, 10) }
  let(:price_drops) { Checkout::Promotional::PriceDrops.new(product_1.code, 2, 850) }

  let(:basket)      { Checkout::Basket.new([price_drops, percent_off]) }

  context 'when products: 1, 2, 3' do
    it 'total price expected is £66.78' do
      basket.scan(product_1)
      basket.scan(product_2)
      basket.scan(product_3)
      expect(basket.total).to eq('£66.78')
    end
  end

  context 'when products: 1, 3, 1' do
    it 'total price expected is £36.95' do
      basket.scan(product_1)
      basket.scan(product_3)
      basket.scan(product_1)
      expect(basket.total).to eq('£36.95')
    end
  end

  context 'when products: 1, 2, 1, 3' do
    it 'total price expected is £73.76' do
      basket.scan(product_1)
      basket.scan(product_2)
      basket.scan(product_1)
      basket.scan(product_3)
      expect(basket.total).to eq('£73.76')
    end
  end
end
