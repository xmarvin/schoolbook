class BaseTest
  include Mongoid::Document

  field :question, :type => String
  belongs_to :chapter

  has_many :answers
end
