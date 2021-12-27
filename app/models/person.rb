class Person < ApplicationRecord
  validates :name, :cpf, :active, presence: true
end
