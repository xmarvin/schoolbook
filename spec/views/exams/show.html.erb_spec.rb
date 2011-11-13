require 'spec_helper'

describe "exams/show.html.erb" do
  before(:each) do
    @exam = assign(:exam, stub_model(Exam))
  end

  it "renders attributes in <p>" do
    render
  end
end
