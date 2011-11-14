class Exam
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true
  belongs_to :user
  belongs_to :chapter


  def build_tests(tests)

      tests.each { |test|
        self.answers.create!(:base_test => test)

      }
  end

  def result
    res = 0.0;
    self.answers.each {|a|
      res += a.result
    }
    res / self.answers.count

  end


end
