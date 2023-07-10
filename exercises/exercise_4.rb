require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
#Create stores
Store.create(name: 'Surrey', annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
Store.create(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Store.create(name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

#Fetch mens stores
@mens_stores = Store.where(mens_apparel: true)

#Output the names and revenue
@mens_stores.each do |store|
    puts "Store name: #{store.name}"
    puts "Annual Revenue: #{store.annual_revenue}"
    puts "---"
end

#Fetch womens stores
@women_stores = Store.where(womens_apparel: true).where("annual_revenue < 1000000")

#Output the names and revenue
@women_stores.each do |store|
    puts "Store Name: #{store.name}"
    puts "Annual Revenue: #{store.annual_revenue}"
    puts "---"
end