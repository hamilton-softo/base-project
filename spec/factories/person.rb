FactoryBot.define do
  factory :person do
    name {Faker::Name.name} 
    cpf {Faker::CPF.pretty}
    email {Faker::Internet.email}
    address {Faker::Address.full_address}
    birthday {Faker::Date.birthday}
    active {true}
  end
end
