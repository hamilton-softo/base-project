class Person < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true
  validates :active, presence: true
end
