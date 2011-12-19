module ExamsHelper

  def state e
    content_tag(:div, "SUCCESS!", :class => :passed)
    e.passed? ? content_tag(:div, "SUCCESS!", :class => :passed) :  content_tag(:div, "FAILED", :class => :not_passed)
  end
end
