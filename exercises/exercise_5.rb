require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...

#total rev
total_revenue = Store.sum(:annual_revenue)
#average rev
average_revenue = Store.average(:annual_revenue)
#high rev store count
high_revenue_stores_count = Store.where("annual_revenue >= ?", 1000000).count

#Outputs
puts "Total Revenue: $#{total_revenue}"
puts "Average Annual Revenue: $#{average_revenue}"
puts "Number of High Revenue Stores: #{high_revenue_stores_count}"