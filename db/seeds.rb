#Create Products
for i in 0..10
    product = Product.new(name: "name#{i}", description: "description#{i}", brand: "brand#{i}", quantity: 10, price: 200)
    product.save
end