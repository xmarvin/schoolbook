class Answer
  include Mongoid::Document
  include Mongoid::Timestamps


  field :answer, :type => String
  belongs_to :base_test
  belongs_to :exam


  def result
    base_test.result_for(self.answer)
  end


end
