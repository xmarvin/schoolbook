class Admin::ImagesController < Admin::BaseController
  belongs_to :book, :finder => :find_by_title
end
