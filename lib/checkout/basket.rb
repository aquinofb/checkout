module Checkout
	class Basket
		def initialize(promotions = [])
			@promotions, @items = promotions, Checkout::ItemCollection.new
		end

		def scan(product)
			if item = items.find_by_product(product.code)
				item.increment!
			else
				items << Item.new(product)
			end
		end

		def total
			amount = items.total
			amount -= total_discount(items) if promotions.any?
			Currency.parse(amount)
		end

		private
			attr_reader :items, :promotions

			def total_discount(items)
				promotions.reduce(0) do |sum, promo|
					sum + promo.apply(items, sum)
				end
			end
	end
end
