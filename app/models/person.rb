class Person < ApplicationRecord
  
    validates :name, :cpf, :active, presence: true
    validates :active, inclusion: { in: [ true, false ] }

end
