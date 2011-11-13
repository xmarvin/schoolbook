require 'spec_helper'

describe "admin/images/new.html.erb" do
  before(:each) do
    assign(:admin_image, stub_model(Admin::Image).as_new_record)
  end

  it "renders new admin_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_images_path, :method => "post" do
    end
  end
end
