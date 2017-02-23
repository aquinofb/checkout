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

# this class should receive the price limit and the percentage of the discount
percent_off = Checkout::Promotional::PercentOff.new(6000, 10)

# this class should receive the product code, how many products to trigger the promo and the new price
price_drops = Checkout::Promotional::PriceDrops.new(product_1.code, 2, 850)

basket = Checkout::Basket.new([price_drops, percent_off])
basket.scan(product_1)
basket.scan(product_2)
basket.scan(product_3)
basket.total # £66.78
```
for more examples please see: `spec/checkout_spec.rb`

### Comments
For this test, I tried to build thinking in a real world, like a new module to a system, not a piece of code. So, in this solution we can create N different promotions without change code. The solution for promotions is not tied to some number(i.e. 2, 10%, 60...) or some product(i.e. Lavender...), you can create custom promotions for what you want, as you want.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

