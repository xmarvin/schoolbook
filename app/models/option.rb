class Option
  include Mongoid::Document

  field :title, :type => String
  field :correct, :type => Boolean
  
  embedded_in :test_with_options

end
