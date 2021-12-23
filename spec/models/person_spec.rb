require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }

    context 'invalid cpf' do
      it 'is a invalid record' do
        person = build(:person, cpf: '1234455')
        expect(person).not_to be_valid
      end
    end

    context 'invalid email' do
      it 'is a invalid record' do
        person = build(:person, email: 'not_an_email')
        expect(person).not_to be_valid
      end
    end

    context 'no email given' do
      it 'is a valid record' do
        person = build(:person, email: nil)
        expect(person).to be_valid
      end
    end

    context 'active' do
      it 'cant be nil' do
        person = build(:person, active: nil)
        expect(person).not_to be_valid
      end
    end
  end
end
