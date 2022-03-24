# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    cpf { 'MyString' }
    email { 'MyString' }
    address { 'MyString' }
    birthday { '2022-03-23' }
    active { false }
  end
end
