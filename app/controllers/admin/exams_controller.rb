class Admin::ExamsController < Admin::BaseController
  before_filter :find_book, :only => :index
  private

  def collection
    @exams = Exam.all
  end

  def find_book
    @book = Book.find_by_title(params[:book_id])
  end

end
