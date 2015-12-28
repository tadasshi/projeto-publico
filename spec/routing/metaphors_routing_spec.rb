require "spec_helper"

describe MetaphorsController do
  describe "routing" do

    it "routes to #index" do
      get("/metaphors").should route_to("metaphors#index")
    end

    it "routes to #new" do
      get("/metaphors/new").should route_to("metaphors#new")
    end

    it "routes to #show" do
      get("/metaphors/1").should route_to("metaphors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metaphors/1/edit").should route_to("metaphors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metaphors").should route_to("metaphors#create")
    end

    it "routes to #update" do
      put("/metaphors/1").should route_to("metaphors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metaphors/1").should route_to("metaphors#destroy", :id => "1")
    end

  end
end
