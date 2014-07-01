require 'spec_helper'

describe "admin/images/show.html.erb" do
  before(:each) do
    @admin_image = assign(:admin_image, stub_model(Admin::Image))
  end

  it "renders attributes in <p>" do
    render
  end
end
