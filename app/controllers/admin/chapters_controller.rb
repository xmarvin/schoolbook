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
    update! do |s,f|
      s.html{
        redirect_to [:edit,  :admin, @book,@chapter]
      }
    end
  end

  def reposition
    positions = params[:data]
    positions.each do |item|
      it = item[1]
      ch = Chapter.find(it[:id])
      ch.pos = it[:pos].to_i
      ch.save
    end

    render :nothing => true

  end


end
