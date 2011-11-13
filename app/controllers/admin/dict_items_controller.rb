class Admin::DictItemsController < Admin::BaseController
  belongs_to :book, :finder => :find_by_title
        def create
    create! do |s,f|
      s.html{
        redirect_to [:admin, @book, :dict_items]
      }
    end
  end
end
