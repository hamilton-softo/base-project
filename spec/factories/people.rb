FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    cpf { '419.356.777-05' }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
    birthday { "2021-12-22" }
    active { false }
  end
end
