require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/people', type: :request do

  path '/api/people' do
    get('list people') do
      tags 'People'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        consumes 'application/json'
        produces 'application/json', 'application/xml'

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    post('create person') do
      tags 'People'
      consumes 'application/json'
      produces 'application/json', 'application/xml'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          person: {
            type: :object,
            properties: {
              name: { type: 'string' },
              cpf: { type: 'string' },
              email: { type: 'string' },
              address: { type: 'string' },
              birthday: { type: 'string' },
              active: { type: 'string' }
            },
            required: %w[name cpf active]
          }
        }
      }

      let!(:params) do
        {
          person: {
            name: Faker::Name.name,
            cpf: Faker::IDNumber.brazilian_citizen_number,
            email: Faker::Internet.email,
            address: Faker::Address.full_address,
            birthday: Faker::Date.birthday,
            active: true
          }
        }
      end

      response(201, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/people/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    let!(:person) { create(:person) }

    get('show person') do
      response(200, 'successful') do
        let!(:id) { person.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update person') do
      consumes 'application/json'
      produces 'application/json', 'application/xml'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          person: {
            type: :object,
            properties: {
              name: { type: 'string' },
              cpf: { type: 'string' },
              email: { type: 'string' },
              address: { type: 'string' },
              birthday: { type: 'string' },
              active: { type: 'string' }
            },
            required: %w[name cpf active]
          }
        }
      }
      response(200, 'successful') do
        let!(:params) do
          {
            person: {
              name: Faker::Name.name,
              cpf: Faker::IDNumber.brazilian_citizen_number,
              email: Faker::Internet.email,
              address: Faker::Address.full_address,
              birthday: Faker::Date.birthday,
              active: true
            }
          }
        end
        let!(:id) { person.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    put('update person') do
      consumes 'application/json'
      produces 'application/json', 'application/xml'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          person: {
            type: :object,
            properties: {
              name: { type: 'string' },
              cpf: { type: 'string' },
              email: { type: 'string' },
              address: { type: 'string' },
              birthday: { type: 'string' },
              active: { type: 'string' }
            },
            required: %w[name cpf active]
          }
        }
      }

      response(200, 'successful') do
        let!(:params) do
          {
            person: {
              name: Faker::Name.name,
              cpf: Faker::IDNumber.brazilian_citizen_number,
              email: Faker::Internet.email,
              address: Faker::Address.full_address,
              birthday: Faker::Date.birthday,
              active: true
            }
          }
        end
  
        let!(:id) { person.id }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete person') do
      let!(:id) { person.id }

      response(204, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: ''
            }
          }
        end
        run_test!
      end
    end
  end
end
