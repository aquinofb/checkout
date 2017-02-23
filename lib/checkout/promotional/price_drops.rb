module Checkout
	module Promotional
		class PriceDrops
			def initialize(product_code, quantity, new_price)
				@product_code, @quantity, @new_price = product_code, quantity, new_price
			end

			def apply(items, *)
				item = items.find_by_product(product_code)
				if item && item.qnt >= quantity
					return (item.product_price - new_price) * item.qnt
				end
				0
			end

			private
				attr_reader :product_code, :quantity, :new_price
		end
	end
end 
