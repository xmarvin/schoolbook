class BaseTest
  include Mongoid::Document

  field :question, :type => String
  field :level, :type => Integer, :default => 1
  field :main, :type => Boolean, :default => true
  belongs_to :chapter

  has_many :answers

  scope :for_last, where(:main => true)

  scope :by_level, lambda { |c| where(:level => c) }


end
