class Option
  include Mongoid::Document

  field :title, :type => String
  field :num, :type => Integer   , :default => 0
  field :correct, :type => Boolean, :default => false

  embedded_in :option_test

end
