# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  context 'GET #index' do
    it 'should sucess and render to json' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[]')
    end

    it 'should array empty' do
      get :index
      expect(assigns(:people)).to be_empty
    end

    it 'should array one person' do
      create(:person)
      get :index
      expect(assigns(:people)).to_not be_empty
    end
  end

  context 'GET #show' do
    let(:person) { create(:person) }

    it 'should success and render to edit page' do
      get :show, params: { id: person.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:person)).to eq(person)
    end

    it 'where have id' do
      get :show, params: { id: person.id }
      expect(assigns(:person)).to be_a(Person)
      expect(assigns(:person)).to eq(person)
    end
  end

  context 'POST #create' do
    let!(:params) {
      {
        name: 'Teste',
        cpf: '123.456.789-00',
        active: 'true',
        address: 'teste ',
        birthday: '2021-10-25',
        email: 'teste@test.com'
      }
    }
    it 'create a new person' do
      post :create, params: { person: params }
      expect(response).to have_http_status(:created)
    end

    it 'not create a new person' do
      params = { name: '' }

      post :create, params: { person: params }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'PUT #update' do
    let!(:person) { create(:person) }

    it 'should update person info' do
      params = { name: 'Teste 2' }
      put :update, params: { id: person.id, person: params }
      person.reload
      expect(person.name).to eq(params[:name])
    end

    it 'should not update person info' do
      params = { name: nil }
      put :update, params: { id: person.id, person: params }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'DELETE #destroy' do
    let!(:person) { create(:person) }

    it 'should delete person info' do
      delete :destroy, params: { id: person.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
