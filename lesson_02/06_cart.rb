 # cart = {"qwe"=>{:price=>1.5, :quantity=>1.0, :subtotal=>1.5}, "asd"=>{:price=>1.5, :quantity=>2.0, :subtotal=>3.0}, "zxc"=>{:price=>3.0, :quantity=>0.5, :subtotal=>1.5}}

cart = {}

loop do
  puts "Product"
  product = gets.chomp

  break if product == "stop"
    
  puts "Price"
  price = gets.chomp.to_f
    
  puts "Quantity"
  quantity = gets.chomp.to_f

  cart[product] = {
    price: price,
    quantity: quantity,
    subtotal: price * quantity
  }
end

def cart_total(cart)
  total = 0
  cart.each do |product, product_data|
    total += product_data[:subtotal]
  end
  return total
end

puts "Your cart: #{cart}"
puts "Total: #{cart_total(cart)}"
