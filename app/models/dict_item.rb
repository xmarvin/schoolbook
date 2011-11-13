class DictItem
  include Mongoid::Document
  field :word, :type => String
  field :tip, :type => String
  belongs_to :book
end
