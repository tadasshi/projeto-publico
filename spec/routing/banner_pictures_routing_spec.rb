require "rails_helper"

RSpec.describe BannerPicturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/banner_pictures").to route_to("banner_pictures#index")
    end

    it "routes to #new" do
      expect(:get => "/banner_pictures/new").to route_to("banner_pictures#new")
    end

    it "routes to #show" do
      expect(:get => "/banner_pictures/1").to route_to("banner_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/banner_pictures/1/edit").to route_to("banner_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/banner_pictures").to route_to("banner_pictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/banner_pictures/1").to route_to("banner_pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/banner_pictures/1").to route_to("banner_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/banner_pictures/1").to route_to("banner_pictures#destroy", :id => "1")
    end

  end
end
