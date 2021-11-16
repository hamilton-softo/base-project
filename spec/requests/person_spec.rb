require 'swagger_helper'

RSpec.describe 'person', type: :request do

 #Lista all Person
  path '/person' do
    # You'll want to customize the parameter types...
    
    get('show all person') do
      tags 'Person'
      response(200, 'successful') do
        let(:id) { '123' }

        it 'returns 200' do
          expect(status).to eq(200) 
        end
        run_test!
      end
    end
  end

  path '/person/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show a person') do
      tags 'Person'
      response(200, 'successful') do
        let(:id) { '123' }
        it 'returns 200' do
          expect(status).to eq(200) 
        end
        
        run_test!
      end
    end
  end

  #Atualiza a Person
  path '/person' do

    post 'Creates a Person' do
      tags 'Person'
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
         
        end
       
      end

      response '400', 'invalid request' do
        
        it 'returns 400' do
         
        end
       
      end
    end
  end

  #Atualiza a Person
  path '/person/{id}' do

    put 'Update a Person' do
      tags 'Person'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id', in: :body, schema: {
        type: :object,
        properties: {
          person: { '$ref' => '#/components/schemas/person' }
          },
        required: [ 'name', 'cpf', 'active' ]
      }

      response '201', 'Person Updated' do
       
      end

      response '400', 'invalid request' do
     
      end
    end
  end

  #Atualiza a person
  path '/person/{id}' do

    patch 'Update a Person' do
      tags 'Person'
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
  path '/person/{id}' do

    delete 'Delete a Person' do
      tags 'Person'
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
