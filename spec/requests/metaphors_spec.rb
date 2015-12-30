require 'rails_helper'

RSpec.describe "Metaphors", type: :request do
  describe "GET /metaphors" do
    it "works! (now write some real specs)" do
      get metaphors_path
      expect(response).to have_http_status(200)
    end
  end
end
