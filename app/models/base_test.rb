class BaseTest
  include Mongoid::Document

  field :question, :type => String
  field :level, :type => Integer, :default => 1

  belongs_to :chapter

  has_many :answers


  scope :by_level, lambda { |c| where(:level => c) }


end
