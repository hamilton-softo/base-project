# frozen_string_literal: true

json.extract! user, :id, :name, :cpf, :email, :address, :birthday, :active
json.url user_url(user, format: :json)
