class User < ApplicationRecord
  validates_presence_of :name, :cpf, :email, :address, :birthday
  validates_inclusion_of :active, in: [true, false]
end
