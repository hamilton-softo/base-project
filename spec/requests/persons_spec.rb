RSpec.describe "Persons", type: :request do
  let(:valid_attributes) { build(:person).attributes }

  let(:invalid_attributes) { build(:person, name: nil).attributes }

  describe "GET /index" do
    it "renders a successful response" do
      Person.create! valid_attributes
      get persons_url, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      person = Person.create! valid_attributes
      get person_url(person), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Person" do
        expect {
          post persons_url,
               params: { person: valid_attributes }, as: :json
        }.to change(Person, :count).by(1)
      end

      it "renders a JSON response with the new person" do
        post persons_url,
             params: { person: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Person" do
        expect {
          post persons_url,
               params: { person: invalid_attributes }, as: :json
        }.to change(Person, :count).by(0)
      end

      it "renders a JSON response with errors for the new person" do
        post persons_url,
             params: { person: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "New Name" } }

      it "updates the requested person" do
        person = Person.create! valid_attributes
        patch person_url(person),
              params: { person: new_attributes }, as: :json
        person.reload
        expect(person.name).to eq("New Name")
      end

      it "renders a JSON response with the person" do
        person = Person.create! valid_attributes
        patch person_url(person),
              params: { person: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the person" do
        person = Person.create! valid_attributes
        patch person_url(person),
              params: { person: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested person" do
      person = Person.create! valid_attributes
      expect {
        delete person_url(person), as: :json
      }.to change(Person, :count).by(-1)
    end
  end
end
