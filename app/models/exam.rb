class Exam
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true
  belongs_to :user
  belongs_to :chapter
  field :result

  default_scope :order => [:created_at, :desc]
  MIN_SCORE = 0.75

  def build_tests(tests)

    tests.each { |test|
      self.answers.create!(:base_test => test)

    }
  end

  def passed?
    self.result.to_i > MIN_SCORE
  end


  def calc_result!
    if (self.answers && self.answers.count > 0)
      res = 0.0;
      self.answers.each { |a|
        res += a.result
      }
      self.result = res / self.answers.count
      self.save
    end

  end


end
