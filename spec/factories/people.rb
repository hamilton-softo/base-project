# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { 'Name' }
    cpf { 'CPF' }
    email { 'email' }
    address { 'Address' }
    birthday { '2022-05-03' }
    active { false }
  end
end
