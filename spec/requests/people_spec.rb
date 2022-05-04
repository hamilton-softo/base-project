# frozen_string_literal: true

require 'swagger_helper'

describe 'People API' do
  path '/people' do
    get 'List people' do
      tags 'People'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :person, in: :body, schema: {
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

      response '200', 'List of people' do
        let(:person) { FactoryBot.attributes_for(:person) }

        run_test!
      end
    end
  end

  path '/people' do
    post 'Creates a person' do
      tags 'People'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :person, in: :body, schema: {
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

      response '201', 'person created' do
        let(:person) { FactoryBot.attributes_for(:person) }

        run_test!
      end

      response '422', 'invalid request' do
        let(:person) { { name: '' } }

        run_test!
      end
    end
  end

  path '/people/{id}' do
    get 'Retrieves a person' do
      tags 'People'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'person found' do
        schema type: :object, properties: {
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
          address: { type: :string },
          birthday: { type: :string },
          active: { type: :boolean }
        }, required: %w[name cpf active]

        let(:id) { FactoryBot.create(:person).id }

        run_test!
      end

      response '404', 'person not found' do
        let(:id) { '42' }

        run_test!
      end
    end
  end

  path '/people/{id}' do
    put 'Update a person' do
      tags 'People'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :person, in: :body, schema: {
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
      response '200', 'name found' do
        let(:id) { FactoryBot.create(:person).id }
        let(:person) { FactoryBot.attributes_for(:person) }

        run_test!
      end

      response '404', 'person not found' do
        let(:id) { 'invalid' }
        let(:person) { { name: '' } }

        run_test!
      end
    end
  end
end
