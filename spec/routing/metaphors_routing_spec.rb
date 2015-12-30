require "rails_helper"

RSpec.describe MetaphorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/metaphors").to route_to("metaphors#index")
    end

    it "routes to #new" do
      expect(:get => "/metaphors/new").to route_to("metaphors#new")
    end

    it "routes to #show" do
      expect(:get => "/metaphors/1").to route_to("metaphors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/metaphors/1/edit").to route_to("metaphors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/metaphors").to route_to("metaphors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/metaphors/1").to route_to("metaphors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/metaphors/1").to route_to("metaphors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/metaphors/1").to route_to("metaphors#destroy", :id => "1")
    end

  end
end
