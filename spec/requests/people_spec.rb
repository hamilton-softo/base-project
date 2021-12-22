require "rails_helper"

RSpec.describe "People", type: :request do
  describe "GET /show" do

    before do
      @person = create(:person)
    end

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
          active: @person.active
        }.to_json

        expect(response.body).to eq(expected)
      end
    end

    context "given an non existing person" do
      it "returns http not found" do
        get "/people/12"

        expect(response).to have_http_status(:not_found)
      end

      it "sets a body message" do
        get "/people/12"
        expected = { message: "Couldn't find Person with 'id'=12" }.to_json

        expect(response.body).to eq(expected)
      end
    end
  end
end