require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'user found' do
        schema type: :object, properties: {
          id: { type: :integer },
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        },
               required: %w[id name cpf email address birthday active]
        let(:id) { create(:user).id }
        run_test!
      end
    end

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
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
        required: %w[name cpf email address birthday active]
      }

      response '201', 'user created' do
        let(:user) { create(:user).attributes }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object, properties: {
          id: { type: :integer },
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        },
               required: %w[id name cpf email address birthday active]
        let(:id) { create(:user).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end

    put 'Updates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        },
        required: ['id']
      }

      response '204', 'user updated' do
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { id: nil } }
        run_test!
      end
    end

    delete 'Delete a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :string

      response '204', 'User deleted' do
        run_test!
      end
    end
  end
end
