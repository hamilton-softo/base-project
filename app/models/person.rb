class Person < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :active, exclusion: [nil]
end
