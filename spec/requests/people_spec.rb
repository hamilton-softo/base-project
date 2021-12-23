require "rails_helper"

RSpec.describe "People", type: :request do
  before do
    @person = create(:person)
  end

  describe "GET /people" do
    it "returns http success" do
      get "/people"

      expect(response).to have_http_status(:success)
    end

    it "returns an array of people" do
      get "/people"

      expected = [{
        id: @person.id,
        name: @person.name,
        cpf: @person.cpf,
        email: @person.email,
        address: @person.address,
        birthday: @person.birthday,
        active: @person.active,
      }].to_json

      expect(response.body).to eq(expected)
    end
  end

  describe "GET /people/:id" do
    context "given an existing person" do
      it "returns http success" do
        get "/people/#{@person.id}"

        expect(response).to have_http_status(:success)
      end

      it "returns the expected person data" do
        get "/people/#{@person.id}"

        expected = {
          id: @person.id,
          name: @person.name,
          cpf: @person.cpf,
          email: @person.email,
          address: @person.address,
          birthday: @person.birthday,
          active: @person.active,
        }.to_json

        expect(response.body).to eq(expected)
      end
    end

    context "given a non existing person" do
      it "returns http not found" do
        get "/people/12"

        expect(response).to have_http_status(:not_found)
      end

      it "sets a body message" do
        get "/people/0"
        expected = { message: "Couldn't find Person with 'id'=0" }.to_json

        expect(response.body).to eq(expected)
      end
    end
  end

  describe "DELETE /people" do
    context "given an existing person" do
      it "returns http no_content" do
        delete "/people/#{@person.id}"

        expect(response).to have_http_status(:no_content)
      end
    end

    context "given a non existing person" do
      it "returns an array of people" do
        delete "/people/0"
        expected = { message: "Couldn't find Person with 'id'=0" }.to_json

        expect(response.body).to eq(expected)
      end
    end
  end
end
