class ChaptersController < ApplicationController
  belongs_to :book

  def index
    index!{
      @root_chapter = @book.chapters.root.first
    }
  end
end
