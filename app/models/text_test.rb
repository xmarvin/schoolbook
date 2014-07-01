class TextTest < BaseTest

  field :answer

    def result_for(ans)

       self.answer.eql?(ans) ? 1 : 0
    end

end
