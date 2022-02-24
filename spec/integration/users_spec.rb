require 'swagger_helper'

describe 'Users API' do

  path '/users' do
    get 'List users' do
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
        }
      }

      response '200', 'List of users' do
        let(:user) { attributes_for(:user) }
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
        required: [ 'name', 'cpf', 'active' ]
      }

      response '201', 'user created' do
        let(:user) { attributes_for(:user) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { {name: ''} }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

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
          required: [ 'name', 'cpf', 'active' ]

        let(:id) { create(:user).id }
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
      parameter name: :id, :in => :path, :type => :integer
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
          required: [ 'name', 'cpf', 'active' ]
        }
      response '200', 'user found' do


        let(:id) { create(:user).id }
        let(:user) { attributes_for(:user) }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        let(:user) { {name: ''} }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete 'Destroy a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '204', 'user destroyed' do
        let(:id) { create(:user).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end