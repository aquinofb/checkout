module Checkout
	class ItemCollection
		def initialize(items = [])
			@items = items
		end

		def <<(item)
			items << item
		end

		def find_by_product(code)
			items.detect do |item|
				item.product_code.eql?(code)
			end
		end

		def total
			items.map(&:total).inject(:+)
		end

		def size
			items.size
		end

		private
			attr_reader :items
	end
end
