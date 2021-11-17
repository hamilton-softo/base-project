require 'rails_helper'

RSpec.describe PeopleController , type: :request do
  
  describe "Return People" do
    it "returns http success" do
      get '/people', as: :json
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "Return a Person" do
    it "returns http success" do
      person = create(:person)
      get "/people/#{person.id}",   as: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "Create Person" do
    it "returns http success" do
      person_params = attributes_for(:person)
      expect{ 
        post "/people", params: {person: person_params}, as: :json
      }.to change(Person, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "Update Person " do
    let(:person){create(:person)}
    it "Update Person" do
      patch "/people/#{person.id}",  :params => { person:{:name=>"Eduardo Santos2"}}, as: :json
      expect(response).to have_http_status(:success)
    end 
  end

  describe "Delete Person" do
    it "Delete Person" do
      person = create(:person)
      delete "/people/#{person.id}", :params =>{ id: person.id }, as: :json
      expect(response).to have_http_status(:success)
    end
  end

end
