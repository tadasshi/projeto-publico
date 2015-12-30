require 'rails_helper'

RSpec.describe "Ebooks", type: :request do
  describe "GET /ebooks" do
    it "works! (now write some real specs)" do
      get ebooks_path
      expect(response).to have_http_status(200)
    end
  end
end
