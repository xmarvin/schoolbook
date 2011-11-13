require 'spec_helper'

describe "admin/images/edit.html.erb" do
  before(:each) do
    @admin_image = assign(:admin_image, stub_model(Admin::Image))
  end

  it "renders the edit admin_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_images_path(@admin_image), :method => "post" do
    end
  end
end
