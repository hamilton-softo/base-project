require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'Validate name a person' do
    it 'is valid a person' do
      person = Person.new(name: 'João', cpf: '123.456.789-00', active: true)

      expect(person).to be_valid
    end

    it 'invalid a person' do
      person = Person.new(name: nil)

      expect(person).to_not be_valid
    end

    it 'return a message to invalid a person' do
      person = Person.new(name: nil)
      person.valid?
      expect(person.errors[:name]).to include("can't be blank")
    end
  end

  context 'Validate cpf a person' do 
    it 'is valid a person' do 
      person = Person.new(name: 'João', cpf: '123.456.789-00', active: true)

      expect(person).to be_valid
    end

    it 'invalid a person' do
      person = Person.new(cpf: nil)

      expect(person).to_not be_valid
    end

    it 'return a message to invalid a person' do
      person = Person.new(cpf: nil)
      person.valid?
      expect(person.errors[:cpf]).to include("can't be blank")
    end
  end

  context 'Validate cpf a person' do 
    it 'is valid a person' do 
      person = Person.new(name: 'João', cpf: '123.456.789-00', active: true)

      expect(person).to be_valid
    end

    it 'invalid a person' do
      person = Person.new(active: nil)

      expect(person).to_not be_valid
    end

    it 'return a message to invalid a person' do
      person = Person.new(active: nil)
      person.valid?
      expect(person.errors[:active]).to include("can't be blank")
    end
  end
end
