require "rails_helper"

RSpec.describe "Phone management", :type => :request do

  it "creates a phone" do
    headers = {
      "ACCEPT" => "application/json",
    }
    post "/api/v1/telephones", :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
    expect(response.body).to include("telephone_number")
  end
end
