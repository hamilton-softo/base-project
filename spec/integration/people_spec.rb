require 'swagger_helper'

describe 'People API' do
  path '/people' do
    get 'List all people' do
      tags 'People'
      consumes 'application/json'
      parameter name: :page, in: :query, required: false, description: 'The desired page', schema: { type: 'integer' }

      response '200', 'Returns all people' do
        let(:page) { 1 }
        before { @person = create(:person) }
        examples 'application/json': [{
                   id: 1, name: 'James', email: 'some@nice.mail', address: 'Mulholland Drive', cpf: '419.356.777-05',
                   birthday: '2019-05-17', active: true
                 }]

        run_test! do |response|
          expected = [{
            id: @person.id,
            name: @person.name,
            cpf: @person.cpf,
            email: @person.email,
            address: @person.address,
            birthday: @person.birthday,
            active: @person.active
          }].to_json
          expect(response.body).to eq(expected)
        end
      end
    end

    post 'Creates a person' do
      tags 'People'
      consumes 'application/json'
      parameter name: :person, in: :body, schema: { '$ref' => '#/components/schemas/new_person' }

      response '201', 'Person Created' do
        let(:person) {
          { name: 'James', email: 'some@nice.mail', address: 'Mulholland Drive', cpf: '419.356.777-05',
            birthday: '2019-05-17', active: true }
        }
        examples 'application/json': {
                   id: 1, name: 'James', email: 'some@nice.mail', address: 'Mulholland Drive', cpf: '419.356.777-05',
                   birthday: '2019-05-17', active: true
                 }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['name']).to eq('James')
          expect(data['email']).to eq('some@nice.mail')
          expect(data['cpf']).to eq('419.356.777-05')
          expect(data['birthday']).to eq('2019-05-17')
          expect(data['address']).to eq('Mulholland Drive')
          expect(data['active']).to be_truthy
        end
      end

      response '422', 'Invalid Request' do
        let(:person) { { name: '', email: 'some@nice.mail', cpf: '419.356.777-05', birthday: '2019-05-17', active: false } }

        examples 'application/json': { message: "Validation failed: Name can't be blank" }

        run_test! do |response|
          expect(response.body).to eq({ message: "Validation failed: Name can't be blank" }.to_json)
        end
      end
    end
  end

  path '/people/{id}' do
    get 'Retrieves a person' do
      tags 'Person'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'person found' do
        before { @person = create(:person) }

        examples 'application/json': {
          id: 1, name: 'James', email: 'some@nice.mail', address: 'Mulholland Drive', cpf: '419.356.777-05',
          birthday: '2019-05-17', active: true
        }

        let(:id) { @person.id }

        run_test! do |response|
          expected = {
            id: @person.id,
            name: @person.name,
            cpf: @person.cpf,
            email: @person.email,
            address: @person.address,
            birthday: @person.birthday,
            active: @person.active
          }.to_json
          expect(response.body).to eq(expected)
        end
      end

      response '404', 'Not Found' do

        examples 'application/json': { message: "Couldn't find Person with 'id'=0" }

        let(:id) { 0 }

        run_test! do |response|
          expect(response.body).to eq({ message: "Couldn't find Person with 'id'=0" }.to_json)
        end
      end
    end
  end
end
