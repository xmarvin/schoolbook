class Chapter
  include Mongoid::Document

  field :title, :type => String
  field :pretty_title, :type => String
  field :pos, :type => Integer
  field :content

  has_many :chapters
  belongs_to :chapter

  belongs_to :book, :polymorphic => true

  has_many :base_tests
  has_many :option_tests
  has_many :text_tests

  has_many :exams

  scope :root, where(:chapter_id => nil)

  before_destroy :attach_childs

  default_scope :order => [:pos,:asc]

  def attach_childs
    return if self.chapter.nil?

    parent = self.chapter

    self.chapters.each do |ch|
      parent.chapters << ch
    end

    parent.save

  end

  key :title

  def to_param
    title
  end

  def self.find_by_title title
    self.where(:title => title).first
  end

end
