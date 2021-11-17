json.array! @people do |person|
    json.id         person.id
    json.name       person.name
    json.cpf        person.cpf
    json.email      person.email
    json.address    person.address
    json.birthday   person.birthday
    json.active     person.active
    json.created_at person.created_at
    json.updated_at person.updated_at
end