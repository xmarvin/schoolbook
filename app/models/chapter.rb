class Chapter
  include Mongoid::Document

  field :title, :type => String
  field :content

  references_many :chapters
  referenced_in :chapter

  referenced_in :book

  has_many :base_tests
  has_many :option_tests

  scope :root, where(:chapter_id => nil)

end
