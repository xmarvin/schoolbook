class OptionTest < BaseTest

  embeds_many :options
  accepts_nested_attributes_for :options, :allow_destroy => true

  def initialize(options = nil)
    super(options)
    if self.options.empty?
      4.times { self.options.build }
    end
  end


end
