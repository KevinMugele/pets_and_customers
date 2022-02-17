# frozen_string_literal: true

require './lib/vetenarian'
require './lib/pet'
require './lib/customer'

RSpec.describe Veterinarian do
  it 'exists' do
    vet = Veterinarian.new("Judy's Vet")

    expect(vet).to be_a Veterinarian
  end

  it 'has a name' do
    vet = Veterinarian.new("Judy's Vet")

    expect(vet.name).to eq("Judy's Vet")
  end

  it 'has no customers' do
    vet = Veterinarian.new("Judy's Vet")

    expect(vet.customers).to eq([])
  end

  it 'adds customers' do
    vet = Veterinarian.new("Judy's Vet")
    joel = Customer.new('Joel', 2)
    samson = Pet.new({ name: 'Samson', type: :dog })
    lucy = Pet.new({ name: 'Lucy', type: :cat })
    joel.adopt(samson)
    joel.adopt(lucy)
    vet.add_customer(joel)

    expect(vet.customers).to eq([joel])
  end

  it 'lists all pets, oldest to youngest' do
    vet = Veterinarian.new("Judy's Vet")
    joel = Customer.new('Joel', 2)
    lily = Pet.new({ name: 'Lily', type: :cat, age: 2 })
    samson = Pet.new({ name: 'Samson', type: :dog, age: 11 })
    lucy = Pet.new({ name: 'Lucy', type: :cat, age: 4 })
    joel.adopt(lily)
    joel.adopt(samson)
    joel.adopt(lucy)
    vet.add_customer(joel)

    expect(vet.list_all_pets).to eq([samson, lucy, lily])
  end

  it 'finds number of pets per customer' do
    vet = Veterinarian.new("Judy's Vet")
    joel = Customer.new('Joel', 2)
    joy = Customer.new('Joy', 3)
    lily = Pet.new({ name: 'Lily', type: :cat, age: 2 })
    samson = Pet.new({ name: 'Samson', type: :dog, age: 11 })
    lucy = Pet.new({ name: 'Lucy', type: :cat, age: 4 })
    joel.adopt(lily)
    joel.adopt(samson)
    joel.adopt(lucy)
    vet.add_customer(joel)

    expect(vet.pets_per_customer(joel)).to eq(3)
    expect(vet.pets_per_customer(joy)).to eq(0)
  end
end
