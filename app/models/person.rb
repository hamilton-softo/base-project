class Person < ApplicationRecord
  
    validates :name, :cpf, presence: true
    validates :active, inclusion: { in: [ true, false ] }

end
