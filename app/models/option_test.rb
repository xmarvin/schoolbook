class OptionTest < BaseTest

  embeds_many :options
  accepts_nested_attributes_for :options, :allow_destroy => true

  before_save :set_nums

  def initialize(options = nil)
    super(options)
    if self.options.empty?
      4.times { self.options.build }
    end
  end

  def result_for(answer)
    correct = self.options.where(:correct => true).first
    correct.num == answer.to_i ? 1 : 0
  end


  def set_nums
    puts "set nums"
    self.options.each {
      |o|
      if o.num==0
        o.num = self.options.map{|o| o.num}.max  + 1
        puts o.num
      end
    }
  end

end
