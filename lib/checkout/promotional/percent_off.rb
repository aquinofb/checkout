module Checkout
	module Promotional
		class PercentOff
			def initialize(price_limit, percentage = 10)
				@price_limit, @percentage = price_limit, percentage
			end

			def apply(items, accumulated_discount = 0)
				total = items.total
				if total > price_limit
					return ((total - accumulated_discount) * (percentage / 100.0)).to_i
				end
				0
			end

			private
				attr_reader :price_limit, :percentage
		end
	end
end
