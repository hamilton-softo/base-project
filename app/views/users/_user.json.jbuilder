json.extract! user, :id, :name, :cpf, :email, :address, :birthday, :active, :created_at, :updated_at
json.url user_url(user, format: :json)
