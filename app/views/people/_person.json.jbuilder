json.extract! person, :id, :name, :cpf, :email, :address, :birthday, :active, :created_at, :updated_at
json.url person_url(person, format: :json)
