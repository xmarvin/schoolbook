class ChaptersController < ApplicationController
  belongs_to :book, :finder => :find_by_title
         before_filter :find_root, :only => [:index, :show]
  def method_for_find
    :find_by_title
  end

  def show
    show!  do
    puts "*"*100
    p @chapter
    content = @chapter.content
    @book.dict_items.each do |item|
      content = content.gsub(item.word, tip_for(item.word, item.tip))
    end

    @chapter_content = content.html_safe
    p @chapter_content
    p "----------"
    end
  end

  def tip_for(word, tip)
      "<span class='tooltip' data-tooltip='#{tip}'>#{word}</span>"
  end

  def test
    puts "*"*10
    @chapter = Chapter.find_by_title(params[:chapter_id])
    @tests = @chapter.base_tests
  end

  def find_root
    @book = Book.find_by_title(params[:book_id])
      @root_chapter = @book.chapters.root.first
  end





end
