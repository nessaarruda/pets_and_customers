class Clinic
 attr_reader :name,
             :pets,
             :customers

 def initialize(name)
   @name = name
   @pets = []
   @customers = []
 end

 def add_pet(pet)
   pets << pet
 end

 def sort_pets
   @pets.sort_by do |pet|
      -pet.age
    end
 end

 def add_customer(customer)
   @customers << customer
 end

 def count_pets(customer_provided)
   @customers.count do |customer|
     customer.pets if customer == customer_provided
   end
 end
end
