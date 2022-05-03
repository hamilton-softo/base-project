# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/people', type: :request do
  let!(:person) { FactoryBot.create(:person) }

  describe 'GET /index' do
    before { person.reload }

    it 'renders a successful response' do
      get people_url, as: :json
      resp = JSON.parse(response.body)

      expect(response).to be_successful
      expect(resp).to include(include('id' => person.id))
    end
  end

  describe 'GET /show' do
    before { person.reload }

    it 'renders a successful response' do
      get person_url(person), as: :json

      expect(response).to be_successful
      expect(JSON.parse(response.body)).to include('id' => person.id)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Person' do
        expect do
          post people_url, params: { person: person.dup.attributes }, as: :json
        end.to change(Person, :count).by(1)
      end

      it 'renders a JSON response with the new person' do
        post people_url, params: { person: person.dup.attributes }, as: :json

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect do
          post people_url, params: { person: { name: 'Name' } }, as: :json
        end.to change(Person, :count).by(0)
      end

      it 'renders a JSON response with errors for the new person' do
        post people_url, params: { person: { name: 'Name' } }, as: :json
        errors = JSON.parse(response.body).values

        expect(response).to have_http_status(:unprocessable_entity)
        expect(errors).to include(include("can't be blank"))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested person' do
        patch person_url(person), params: { person: { name: 'James' } }, as: :json
        person.reload

        expect(response).to have_http_status(:ok)
        expect(person.name).to eq('James')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the person' do
        patch person_url(person), params: { person: { cpf: nil } }, as: :json
        errors = JSON.parse(response.body).values

        expect(response).to have_http_status(:unprocessable_entity)
        expect(errors).to include(include("can't be blank"))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested person' do
      expect do
        delete person_url(person), as: :json
      end.to change(Person, :count).by(-1)
    end
  end
end
