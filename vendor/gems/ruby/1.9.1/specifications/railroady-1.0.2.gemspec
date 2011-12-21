# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{railroady}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Preston Lee", "Tobias Crawley", "Peter Hoeg", "Javier Smaldone"]
  s.date = %q{2011-03-14}
  s.description = %q{Ruby on Rails 3 model and controller UML class diagram generator. Originally based on the 'railroad' plugin and contributions of many others. (`sudo port install graphviz` before use!)}
  s.email = ["conmotto@gmail.com", "tcrawley@gmail.com", "peter@hoeg.com", "p.hoeg@northwind.sg", "javier@smaldone.com.ar"]
  s.executables = ["railroady"]
  s.extra_rdoc_files = ["AUTHORS.rdoc", "CHANGELOG.rdoc", "LICENSE.rdoc", "README.rdoc"]
  s.files = ["bin/railroady", "AUTHORS.rdoc", "CHANGELOG.rdoc", "LICENSE.rdoc", "README.rdoc"]
  s.homepage = %q{http://github.com/preston/railroady}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Ruby on Rails 3 model and controller UML class diagram generator.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end