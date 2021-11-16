require 'rails_helper'

RSpec.describe Person, type: :model do
  
  it 'is valid with all data' do
    person = create(:person)
    expect(person).to be_valid 
  end

  context 'Validates' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:active) }
  end

  # it 'is invalid without name' do
  #   person = FactoryBot.build(:person, name: nil)
  #   person.valid?
  #   expect(person.errors[:name]).to include("can't be blank")
  # end

  # it 'is invalid without cpf' do
  #   person = FactoryBot.build(:person, cpf: nil)
  #   person.valid?
  #   expect(person.errors[:cpf]).to include("can't be blank")
  # end

  # it 'is invalid without status' do
  #   person = FactoryBot.build(:person, cpf: nil)
  #   person.valid?
  #   expect(person.errors[:cpf]).to include("can't be blank")
  # end
end
