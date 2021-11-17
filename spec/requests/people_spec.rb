require 'swagger_helper'

RSpec.describe 'People', type: :request do

 #Lista all People
  path '/people.json' do
  get('show all person') do
    tags 'People'
    response(200, 'successful') do
       let(:id) { '123' }
       it 'returns 200' do
          expect(status).to eq(200) 
        end
      end
    end
  end
 
  #Show a Person
  path '/people/{id}.json' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show a person') do
      tags 'People'
      response(200, 'successful') do
        let(:id) { '123' }
        it 'returns 200' do
          expect(status).to eq(200) 
        end
        run_test!
      end
    end
  end

  #Create a Person
  path '/people/{id}.json' do
    post 'Creates a Person' do
      tags 'People'
      consumes 'application/json'
      parameter name: :cpf, name: :email, name: :address, name: :birthday, name: :active, in: :body, schema: {
        type: :object,
        properties: {
          person: { '$ref' => '#/components/schemas/person' }
        },
        required: [ 'name', 'cpf', 'active' ]
      }
      response '201', 'Person created' do
        it 'returns 201' do
          expect(status).to eq(200)
        end
        run_test!
      end
      response '400', 'invalid request' do
        it 'returns 400' do
          expect(status).to eq(200)
        end
        run_test!
      end
    end
  end

  #Update a Person
  path '/people/{id}.json' do
    put 'Update a Person' do
      tags 'People'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id', in: :body, schema: {
        type: :object,
        properties: {
          person: { '$ref' => '#/components/schemas/person' }
        },
        required: [ 'name', 'cpf', 'active' ]
      }
      response '200', 'Person Updated' do
        it 'returns 200' do
          expect(status).to eq(200)
        end
      end
      response '400', 'invalid request' do
        it 'returns 400' do
          expect(status).to eq(400)
        end
      end
    end
  end

  #Atualiza a person
  path '/people/{id}.json' do
    patch 'Update a Person' do
    tags 'People'
    consumes 'application/json'
    parameter name: 'id', in: :path, type: :string, description: 'id', in: :body, schema: {
      type: :object,
      properties: {
        person: { '$ref' => '#/components/schemas/person' }
      },
      required: [ 'name', 'cpf', 'active' ]
      }
      response '200', 'Person Updated' do
      end

      response '400', 'invalid request' do
      end
    end
  end

  #Delete a Person
  path '/people/{id}.json' do
    delete 'Delete a Person' do
    tags 'People'
    consumes 'application/json'
    parameter name: 'id', in: :path, type: :string, description: 'id'
    response '200', 'Person Deleted with success!' do
        it 'returns 200' do
        end
      end
      response '400', 'invalid request' do
        it 'returns 400' do
        end
      end
    end
  end

end
