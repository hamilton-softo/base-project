class Person < ApplicationRecord
  validates_presence_of :name, :cpf
  validates_cpf_format_of :cpf
  validates_email_format_of :email, unless: -> { email.blank? }
  validates :active, inclusion: { in: [ true, false ] }
end
