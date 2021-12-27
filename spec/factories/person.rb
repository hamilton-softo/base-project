# frozen_string_literal: true

FactoryBot.define do
  factory :person, class: Person do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    active { true }
    address { Faker::Address.full_address }
    birthday { Faker::Date.birthday }
    email { Faker::Internet.email }
  end
end
