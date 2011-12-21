class OptionTest < BaseTest

  embeds_many :options
  accepts_nested_attributes_for :options, :allow_destroy => true

  before_save :set_nums

  def initialize(options = nil)
    super(options)
    if self.options.empty?
      3.times { self.options.build }
    end
  end

  def result_for(answer)
    corrects = self.options.where(:correct => true)
    res = 0.0
    answers = answer.split(' ').map{|a| a.to_i}
    answers.each { |a|
       res += [1, corrects.where(:num => a).count].min
    }
    res / corrects.count
  end


  def set_nums
    self.options.each {
      |o|
      if o.num==0
        o.num = self.options.map{|o| o.num}.max  + 1
      end
    }
  end

end
