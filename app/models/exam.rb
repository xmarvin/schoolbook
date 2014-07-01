class Exam
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true
  belongs_to :user
  belongs_to :chapter
  field :result                                      \

  field :blocked, :type => Boolean, :default => false

  default_scope :order => [:created_at, :desc]

  MIN_SCORE = 0.7
  TEACHER_SCORE = 0.4
  EXAM_TEST_COUNT = 5
  def build_tests(tests)

    tests.each { |test|
      self.answers.create!(:base_test => test)

    }


  end

  def passed?
    self.result.to_f > MIN_SCORE
  end

  def level
      self.answers.first.base_test.level
  end

  def should_blocked?
    self.result.to_f <= TEACHER_SCORE
  end

  def self.generate_final_exam(user)
    exam = Exam.where(:chapter => nil, :user_id => user.id).first

    return exam unless exam.nil?

    tests = []

     exam_tests = BaseTest.for_last.to_a
      EXAM_TEST_COUNT.times {
        pos = Random.rand(exam_tests.count)

        tests.push(exam_tests.delete_at(pos))
      }

    exam = Exam.create!(:user => user)
        exam.build_tests(tests)
        exam.save
    exam
  end

    def unlock!
      self.blocked = false
      self.save!
    end

  def calc_result!
    if (self.answers && self.answers.count > 0)
      res = 0.0;
      self.answers.each { |a|
        res += a.result
      }
      self.result = res / self.answers.count

      self.blocked = should_blocked?

      self.save
    end

  end


end
