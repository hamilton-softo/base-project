class User < ApplicationRecord
  validates :name, :cpf, :active, presence: true
end
