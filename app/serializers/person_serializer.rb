class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :birthday
end
