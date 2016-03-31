require 'rails_helper'

RSpec.describe "Biographies", type: :request do
  describe "GET /biographies" do
    it "works! (now write some real specs)" do
      get biographies_path
      expect(response).to have_http_status(200)
    end
  end
end
