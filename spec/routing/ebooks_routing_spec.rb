require "spec_helper"

describe EbooksController do
  describe "routing" do

    it "routes to #index" do
      get("/ebooks").should route_to("ebooks#index")
    end

    it "routes to #new" do
      get("/ebooks/new").should route_to("ebooks#new")
    end

    it "routes to #show" do
      get("/ebooks/1").should route_to("ebooks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ebooks/1/edit").should route_to("ebooks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ebooks").should route_to("ebooks#create")
    end

    it "routes to #update" do
      put("/ebooks/1").should route_to("ebooks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ebooks/1").should route_to("ebooks#destroy", :id => "1")
    end

  end
end
