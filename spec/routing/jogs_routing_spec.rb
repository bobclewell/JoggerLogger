require "spec_helper"

describe JogsController do
  describe "routing" do

    it "routes to #index" do
      get("/jogs").should route_to("jogs#index")
    end

    it "routes to #new" do
      get("/jogs/new").should route_to("jogs#new")
    end

    it "routes to #show" do
      get("/jogs/1").should route_to("jogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jogs/1/edit").should route_to("jogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jogs").should route_to("jogs#create")
    end

    it "routes to #update" do
      put("/jogs/1").should route_to("jogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jogs/1").should route_to("jogs#destroy", :id => "1")
    end

  end
end
