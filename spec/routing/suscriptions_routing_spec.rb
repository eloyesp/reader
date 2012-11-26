require "spec_helper"

describe SuscriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/suscriptions").should route_to("suscriptions#index")
    end

    it "routes to #new" do
      get("/suscriptions/new").should route_to("suscriptions#new")
    end

    it "routes to #show" do
      get("/suscriptions/1").should route_to("suscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/suscriptions/1/edit").should route_to("suscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/suscriptions").should route_to("suscriptions#create")
    end

    it "routes to #update" do
      put("/suscriptions/1").should route_to("suscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/suscriptions/1").should route_to("suscriptions#destroy", :id => "1")
    end

  end
end
