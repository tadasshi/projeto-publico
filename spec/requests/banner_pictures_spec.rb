require 'rails_helper'

RSpec.describe "BannerPictures", type: :request do
  describe "GET /banner_pictures" do
    it "works! (now write some real specs)" do
      get banner_pictures_path
      expect(response).to have_http_status(200)
    end
  end
end
