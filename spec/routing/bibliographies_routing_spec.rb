require "rails_helper"

RSpec.describe BibliographiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bibliographies").to route_to("bibliographies#index")
    end

    it "routes to #new" do
      expect(:get => "/bibliographies/new").to route_to("bibliographies#new")
    end

    it "routes to #show" do
      expect(:get => "/bibliographies/1").to route_to("bibliographies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bibliographies/1/edit").to route_to("bibliographies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bibliographies").to route_to("bibliographies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bibliographies/1").to route_to("bibliographies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bibliographies/1").to route_to("bibliographies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bibliographies/1").to route_to("bibliographies#destroy", :id => "1")
    end

  end
end
