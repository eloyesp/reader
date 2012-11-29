require "spec_helper"

describe HomeController do

  describe "routing" do

    it "routes to #create" do
      get("/search").should route_to("home#search")
    end

    it 'has a helper method' do
      expect(search_path).to eq("/search")
    end

  end

end

