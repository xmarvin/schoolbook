class Book
  include Mongoid::Document
  field :title, :type => String

  references_many :chapters

end
