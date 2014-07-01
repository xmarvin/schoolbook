class Book
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String
  before_save :parametrize_title


  def parametrize_title
    self.title = self.title.parameterize
  end

  has_many :chapters,  :dependent => :destroy
  has_many :images,  :dependent => :destroy
  has_many :dict_items,  :dependent => :destroy

  def to_param
    title
  end

  def self.find_by_title title
    self.where(:title => title).first
  end

end
