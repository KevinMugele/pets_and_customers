# frozen_string_literal: true

class Groomer
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customers_with_oustanding_balances
    @customers.find_all do |customer|
      customer.outstanding_balance != 0
    end
  end

  def number_of_pets(type)
    pets = @customers.map(&:pets).flatten
    pets.count do |pet|
      pet.type == type
    end
  end
end
