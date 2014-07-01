class Admin::ExamsController < Admin::BaseController
  before_filter :find_book, :only => :index

  def unlock
    @exam = Exam.find(params[:id])
    @exam.unlock!
    render :nothing => true
  end

  private

  def collection
    @exams = Exam.where(:chapter_id.ne => nil)
  end

  def find_book
    @book = Book.find_by_title(params[:book_id])
  end

end
