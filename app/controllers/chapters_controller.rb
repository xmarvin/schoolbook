class ChaptersController < ApplicationController
  belongs_to :book, :finder => :find_by_title
  before_filter :find_root, :only => [:index, :show]

  def method_for_find
    :find_by_title
  end

  def show
    show! do |f|
    set_content

      f.pdf{
        render :pdf => "pdf"
      }
    end
  end

  def tip_for(word, tip)
    "<span class='tooltip' data-tooltip='#{tip}'>#{word}</span>"
  end

  def test
    @chapter = Chapter.find_by_title(params[:chapter_id])
    @tests = @chapter.base_tests
  end

  def find_root
    @book = Book.find_by_title(params[:book_id])
    @root_chapter = @book.chapters.root.first
  end

  def set_content
    if @chapter.allowed?(current_user)

         content = @chapter.content.to_s
        @book.dict_items.each do |item|
          content = content.gsub(/(\b)#{item.word}/i, "#{$1} #{tip_for(item.word, item.tip)}")
        end
       @chapter_content = content.html_safe
      end
  end


end
