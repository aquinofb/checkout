# Checkout

## Usage

```shell
# install dependencies
bin/setup

# run console
bin/console
```

```ruby
product_1 = Checkout::Product.new(1, 'Lavender heart', 925)
product_2 = Checkout::Product.new(2, 'Personalised cufflinks', 4500)
product_3 = Checkout::Product.new(3, 'Kids T-shirt', 1995)

percent_off = Checkout::Promotional::PercentOff.new(6000, 10)
price_drops = Checkout::Promotional::PriceDrops.new(product_1.code, 2, 850)

basket = Checkout::Basket.new([price_drops, percent_off])
basket.scan(product_1)
basket.scan(product_2)
basket.scan(product_3)
basket.total # £66.78
```
for more examples please see: `spec/checkout_spec.rb`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

