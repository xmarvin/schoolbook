class Admin::TestsController < Admin::BaseController
  belongs_to :chapter, :finder => :find_by_title

end
