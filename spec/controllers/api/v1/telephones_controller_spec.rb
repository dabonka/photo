require 'rails_helper'
RSpec.describe Api::V1::TelephonesController do
  describe "POST #create" do
    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end
    before do 
      post "create"
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains phone numbers" do
      byebug
      json_response = JSON.parse(response.body)
      expect(hash_body.keys).to match_array([:phone_number])
    end

  end

end
