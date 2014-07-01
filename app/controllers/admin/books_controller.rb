class Admin::BooksController < Admin::BaseController

  def method_for_find
    :find_by_title
  end

end
