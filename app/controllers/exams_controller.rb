class ExamsController < ApplicationController
  belongs_to :chapter, :finder => :find_by_title

  def new
    new! do

      @exam.save
      @exam.user = current_user
      @exam.build_tests(@chapter.base_tests)
      @exam.save
    end

  end

  def update
    @exam = Exam.find(params[:id])

    update! do |s|
      @exam.calc_result!
      s.html {
        redirect_to [@chapter.book, @chapter, :exams]
      }
    end
  end

end
