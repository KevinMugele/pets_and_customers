# frozen_string_literal: true

class Veterinarian
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def find_all_pets
    all_pets = []
    @customers.each do |customer|
      customer.pets.each do |pet|
        all_pets << pet
      end
    end
    all_pets
  end

  def list_all_pets
    find_all_pets.sort_by do |pet|
      -pet.age
    end
  end

  def pets_per_customer(customer)
    customer.count_of_pets
  end
end
