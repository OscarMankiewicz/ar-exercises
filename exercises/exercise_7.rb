require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

#Add validations to employee
class Employee < ActiveRecord::Base
    belongs_to :store

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
    validates :store, presence: true
end

#Add validations to store
class Store < ActiveRecord::Base
    has_many :employees
  
    validates :name, presence: true, length: { minimum: 3 }
    validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validate :must_carry_apparel
  
    def must_carry_apparel
      unless mens_apparel || womens_apparel
        errors.add(:base, "The store must carry at least one of men's or women's apparel")
      end
    end
end
  

#Make store to cause Error

store_name = "Oscars"

store = Store.new(name: store_name)
store.save

if store.errors.any?
    puts "Error creating the store:"
    store.errors.full_messages.each do |message|
        puts "-#{message}"
    end
end