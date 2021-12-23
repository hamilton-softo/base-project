require 'swagger_helper'

describe 'People API' do
  path '/people' do
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
end
