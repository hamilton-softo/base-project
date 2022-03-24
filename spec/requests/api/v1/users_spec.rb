# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/users' do
    get 'List users' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :users, in: :body, schema: {
        type: :array,
        items: {
          properties: {
            name: { type: :string },
            cpf: { type: :string },
            email: { type: :string },
            address: { type: :string },
            birthday: { type: :string },
            active: { type: :boolean }
          }
        }
      }

      response '200', 'List of users' do
        let(:users) do
          { name: 'teste',
            cpf: '12345678910',
            email: 'teste@teste',
            address: 'rua teste',
            birthday: '2022-03-24',
            active: true }
        end
        run_test!
      end
    end
  end

  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        },
        required: %w[name cpf active]
      }

      response '200', 'user created' do
        let(:user) do
          { name: 'teste',
            cpf: '12345678910',
            email: 'teste@teste',
            address: 'rua teste',
            birthday: '2022-03-24',
            active: true }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: '' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 cpf: { type: :string },
                 email: { type: :string },
                 address: { type: :string },
                 birthday: { type: :string },
                 active: { type: :boolean }
               },
               required: %w[name cpf active]

        let(:id) do
          User.create(name: 'teste 2',
                      cpf: '12345678911',
                      email: 'teste@teste',
                      address: 'rua teste',
                      birthday: '2022-03-24',
                      active: true).id
        end
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    put 'Update a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        },
        required: %w[name cpf active]
      }

      response '200', 'user found' do
        let(:id) do
          User.create(name: 'teste 2',
                      cpf: '12345678911',
                      email: 'teste@teste',
                      address: 'rua teste',
                      birthday: '2022-03-24',
                      active: true).id
        end
        let(:user) do
          { name: 'teste',
            cpf: '12345678910',
            email: 'teste@teste',
            address: 'rua teste',
            birthday: '2022-03-24',
            active: true }
        end
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        let(:user) { { name: '' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete 'Destroy a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'user destroyed' do
        let(:id) do
          User.create(name: 'teste 2',
                      cpf: '12345678911',
                      email: 'teste@teste',
                      address: 'rua teste',
                      birthday: '2022-03-24',
                      active: true).id
        end
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
