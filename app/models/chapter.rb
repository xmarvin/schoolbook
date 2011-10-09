class Chapter
  include Mongoid::Document

  field :title, :type => String
  field :content

  references_many :chapters
  referenced_in :chapter

  referenced_in :book

  scope :root, where(:chapter_id => nil)

end
