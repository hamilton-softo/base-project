FactoryBot.define do
  factory :person do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.unique.email }
    cpf { FFaker::IdentificationBR.cpf }
    active { false }
  end
end