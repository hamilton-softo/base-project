# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should allow_value(%w(true false)).for(:active) }

    it 'has valid factory' do
      person = FactoryBot.build(:person)

      expect(person).to be_valid
    end
  end
end
