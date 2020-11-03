require 'minitest/autorun'
require 'minitest/pride'
require './lib/clinic'
require './lib/customer'
require './lib/pet'

class ClinicTest < Minitest::Test

  def setup
    @vet1 = Clinic.new("V")
    @customer1 = Customer.new("Matt", 2)
    @customer2 = Customer.new("Joe", 3)
    @pet1 = Pet.new({name: "Samson", type: :dog, age: 1})
    @pet2 = Pet.new({name: "Sookie", type: :cat, age: 2})
    @pet3 = Pet.new({name: "Milk", type: :dog, age: 3})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Clinic, @vet1
    assert_equal "V", @vet1.name
  end

  def test_vets_have_pets_under_care
    assert_equal [], @vet1.pets
    @vet1.add_pet(@pet1)
    @vet1.add_pet(@pet2)
    assert_equal [@pet1, @pet2], @vet1.pets
  end

  def test_it_can_list_pets_in_order_of_age
    @vet1.add_pet(@pet1)
    @vet1.add_pet(@pet2)
    @vet1.add_pet(@pet3)
    assert_equal [@pet3, @pet2, @pet1], @vet1.sort_pets
  end

  def test_it_can_add_customer
    assert_equal [], @vet1.customers
    @vet1.add_customer(@customer1)
    @vet1.add_customer(@customer2)
    assert_equal [@customer1, @customer2], @vet1.customers
  end

  def test_it_can_count_customers_pets
    @vet1.add_customer(@customer1)
    @vet1.add_customer(@customer2)
    @customer1.adopt(@pet1)
    @customer2.adopt(@pet2)
    assert_equal 1, @vet1.count_pets(@customer1)
    assert_equal 1, @vet1.count_pets(@customer2)
  end
end
