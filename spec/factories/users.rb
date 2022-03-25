FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    cpf { Faker::CPF.numeric }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    birthday { "2000-01-01" }
    active { true }
  end
end
