require 'spec_helper'

describe "exams/test.html.erb" do
  before(:each) do
    @exam = assign(:exam, stub_model(Exam))
  end

  it "renders the edit exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exams_path(@exam), :method => "post" do
    end
  end
end
