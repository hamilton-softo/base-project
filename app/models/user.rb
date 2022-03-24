# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 },
                  format: { with: /[0-9]+/, message: 'only allows numbers' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :active, presence: true
end
