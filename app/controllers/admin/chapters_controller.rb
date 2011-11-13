class Admin::ChaptersController < Admin::BaseController
  belongs_to :book, :finder => :find_by_title

  def method_for_find
    :find_by_title
  end

  def index
    index!{
      @root_chapter = @book.chapters.root.first
    }
  end

  def create
    create! do |s,f|
      s.html{
        redirect_to [:admin, @book, :chapters]
      }
    end
  end

  def update
    puts '*'*100
    p @chapter
    update! do |s,f|
      s.html{
        redirect_to [:edit,  :admin, @book,@chapter]
      }
    end
  end


end
