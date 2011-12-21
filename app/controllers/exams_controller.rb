class ExamsController < ApplicationController
  belongs_to :chapter, :finder => :find_by_title
  before_filter :find_book, :only => [:index, :edit]

  def edit

    @chapter = Chapter.find_by_title(params[:chapter_id])
    @exam = @chapter.exam_for_user(current_user)

    p "*"*100
    p @exam

    redirect_to [@book, @chapter] if @exam.nil?

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

   def find_book
    @book = Book.find_by_title(params[:book_id])
  end


end
