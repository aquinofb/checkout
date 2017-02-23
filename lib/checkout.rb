require "checkout/version"

module Checkout
  autoload :Basket,           'checkout/basket'
  autoload :Item,             'checkout/item'
  autoload :ItemCollection,   'checkout/item_collection'
  autoload :Product,          'checkout/product'
  autoload :Currency,         'checkout/currency'
  autoload :Discount,         'checkout/discount'

  module Promotional
    autoload :PercentOff,     'checkout/promotional/percent_off'
    autoload :PriceDrops,     'checkout/promotional/price_drops'
  end
end
