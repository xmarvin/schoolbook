class Admin::TextTestsController < Admin::TestsController

  def create
    create! do |s,f|
      s.html{
        redirect_to [:admin, @chapter.book, @chapter, :text_tests]
      }
    end
  end

end
