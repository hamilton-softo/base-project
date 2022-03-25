RSpec.describe PersonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/persons").to route_to("persons#index")
    end

    it "routes to #show" do
      expect(get: "/persons/1").to route_to("persons#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/persons").to route_to("persons#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/persons/1").to route_to("persons#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/persons/1").to route_to("persons#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/persons/1").to route_to("persons#destroy", id: "1")
    end
  end
end
