require 'spec_helper'

describe "exams/index.html.erb" do
  before(:each) do
    assign(:exams, [
      stub_model(Exam),
      stub_model(Exam)
    ])
  end

  it "renders a list of exams" do
    render
  end
end
