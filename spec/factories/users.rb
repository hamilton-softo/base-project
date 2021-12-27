FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    active { Faker::Boolean.boolean }
  end
end
