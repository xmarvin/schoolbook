class Chapter
  include Mongoid::Document


  field :title, :type => String
  field :pretty_title, :type => String
  field :pos, :type => Integer
  field :content

  has_many :chapters
  belongs_to :chapter

  belongs_to :book, :polymorphic => true

  has_many :base_tests
  has_many :option_tests
  has_many :text_tests

  has_many :exams

  scope :root, where(:chapter_id => nil)

  before_destroy :attach_childs

  default_scope :order => [:pos, :asc]

  def attach_childs
    return if self.chapter.nil?

    parent = self.chapter

    self.chapters.each do |ch|
      parent.chapters << ch
    end

    parent.save

  end

  key :title

  def to_param
    title
  end

  def self.find_by_title title
    self.where(:title => title).first
  end

  def prev_chapter
    self.book.chapters.where(:pos => self.pos - 1).first
  end


  def exam_for_user(user)

    if (self.base_tests.count > 0)
      user_exams = self.exams.where(:user_id => user.id)

      if (user_exams.count == 0)
        user_exams = build_exams_for_user (user)
      end
      res = nil
       user_exams.each {|e|
        unless e.passed?
          res = e
          break
        end
       }
       res
    end

  end


  def build_exams_for_user (user)
    exams = []

    for i in 1..2 do

      level_tests = self.base_tests.by_level(i)


      if (level_tests.count > 0)
        exam = self.exams.create!(:user => user)
        exam.build_tests(level_tests)
        exam.save
        exams.push(exam)
      end

    end
      exams
  end

  def passed?(user)
    if self.base_tests.empty?
      self.allowed?(user)
    else
      self.exams.where(:result.gte => Exam::MIN_SCORE, :user_id => user.id).count>0
    end
  end

  def allowed?(user)
    res = true
    puts "allowed?"
    if (self.prev_chapter)
      res = self.prev_chapter.passed?(user)
    end
    res
  end


end
