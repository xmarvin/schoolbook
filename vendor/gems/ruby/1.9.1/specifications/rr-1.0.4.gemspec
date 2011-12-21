# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rr}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Takita"]
  s.date = %q{2011-06-16}
  s.description = %q{RR (Double Ruby) is a double framework that features a rich selection of double techniques and a terse syntax. http://xunitpatterns.com/Test%20Double.html}
  s.email = %q{brian@pivotallabs.com}
  s.extra_rdoc_files = ["CHANGES", "README.rdoc"]
  s.files = ["CHANGES", "README.rdoc"]
  s.homepage = %q{http://pivotallabs.com}
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pivotalrb}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{RR (Double Ruby) is a double framework that features a rich selection of double techniques and a terse syntax. http://xunitpatterns.com/Test%20Double.html}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
