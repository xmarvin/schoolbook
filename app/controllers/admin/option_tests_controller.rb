class Admin::OptionTestsController < Admin::TestsController
  def create
    create! do |s,f|
      s.html{
        redirect_to [:admin, @chapter.book, @chapter, :option_tests]
      }
    end
  end


    def update
    update! do |s,f|
      s.html{
        redirect_to [:admin, @chapter.book, @chapter, :option_tests]
      }
    end
  end

end
