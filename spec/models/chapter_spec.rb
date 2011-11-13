require 'spec_helper'

describe Chapter do

  before (:each) do
    @chapter = Chapter.new
  end

  it "should reattach childrens after destroy" do

    root = Chapter.create!

    subroot = Chapter.create!(:chapter => root )

    child1  = Chapter.create!(:chapter => subroot)
    child2  = Chapter.create!(:chapter => subroot)

    Chapter.count.should == 4

    Chapter.find(root.id).chapters.count.should == 1

    subroot.destroy

    Chapter.find(root.id).chapters.count.should == 2

    Chapter.find(child1.id).chapter.should_not == nil
    Chapter.find(child2.id).chapter.should_not == nil


  end

end
