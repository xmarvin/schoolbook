class ExamsController < ApplicationController
  belongs_to :chapter, :finder => :find_by_title, :optional => true
  before_filter :find_book, :only => [:index, :test]

  def test

    @chapter = Chapter.find_by_title(params[:chapter_id])
    @exam = @chapter.exam_for_user(current_user)

    if @exam.nil? or !@chapter.allowed?(current_user)
      redirect_to [@book, (@chapter.next_chapter || @chapter)]
    else
      render :visit_teacher if @exam.blocked?
    end
  end

  def final_test
    @exam = Exam.generate_final_exam(current_user)

  end

  def update
    @exam = Exam.find(params[:id])

    update! do |s|
      @exam.calc_result!

      if @chapter.nil?

         if @exam.passed?

           flash[:msg] = "Good work. You education is finished"
           redirect_to root_path
         else

            flash[:msg] = "Bad. Read again and try again"
            redirect_to root_path
         end
         return
      else

      s.html {
        redirect_to [@chapter.book, @chapter, :exams]
      }
       end

    end
  end

  def find_book
    @book = Book.find_by_title(params[:book_id])
  end


end
