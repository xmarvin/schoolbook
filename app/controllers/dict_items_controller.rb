class DictItemsController < ApplicationController
  belongs_to :book, :finder => :find_by_title
end
