require 'rails_helper'

RSpec.describe PersonController , type: :request do

  describe "GET #index" do
    it "returns http success" do
      get '/person'
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "Return Person" do
    it "returns http success" do
      person = create(:person)
      get "/person/#{person.id}", params: { id: person.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "Create Person" do
    it "returns http success" do
      person_params = attributes_for(:person)
      expect{ 
        post "/person", params: {person: person_params}
      }.to change(Person, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "Update Person " do
    let(:person){create(:person)}
    it "Update Person" do
      patch "/person/#{person.id}",  :params => { person:{:name=>"Eduardo Santos2"}}
      expect(response).to have_http_status(:success)
    end 
  end

  describe "Delete Person" do
    it "Delete Person" do
      person = create(:person)
      get "/person/#{person.id}", params: { id: person.id }
      expect(response).to have_http_status(:success)
    end
  end

end
