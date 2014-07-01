require 'spec_helper'

describe "exams/new.html.erb" do
  before(:each) do
    assign(:exam, stub_model(Exam).as_new_record)
  end

  it "renders new exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exams_path, :method => "post" do
    end
  end
end
