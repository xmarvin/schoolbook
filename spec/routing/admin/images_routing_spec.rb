require "spec_helper"

describe Admin::ImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/images").should route_to("admin/images#index")
    end

    it "routes to #new" do
      get("/admin/images/new").should route_to("admin/images#new")
    end

    it "routes to #show" do
      get("/admin/images/1").should route_to("admin/images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/images/1/edit").should route_to("admin/images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/images").should route_to("admin/images#create")
    end

    it "routes to #update" do
      put("/admin/images/1").should route_to("admin/images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/images/1").should route_to("admin/images#destroy", :id => "1")
    end

  end
end
