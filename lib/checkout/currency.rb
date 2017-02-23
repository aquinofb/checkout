module Checkout
  class Currency
    def self.parse(number, unit = '£')
      "#{unit}%.02f" % (number / 100.0)
    end
  end
end 
