require 'spec_helper'

describe "admin/images/index.html.erb" do
  before(:each) do
    assign(:admin_images, [
      stub_model(Admin::Image),
      stub_model(Admin::Image)
    ])
  end

  it "renders a list of admin/images" do
    render
  end
end
