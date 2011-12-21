# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-gridfs}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Carlson"]
  s.date = %q{2011-06-26}
  s.description = %q{Rack middleware for creating HTTP endpoints for files stored in MongoDB's GridFS}
  s.email = ["blake@coin-operated.net"]
  s.extra_rdoc_files = ["CHANGES.rdoc", "LICENSE", "README.rdoc"]
  s.files = ["CHANGES.rdoc", "LICENSE", "README.rdoc"]
  s.homepage = %q{http://github.com/skinandbones/rack-gridfs}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rack-gridfs}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Serve MongoDB GridFS files from Rack}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<mongo>, ["~> 1.2"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.12"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<mongo>, ["~> 1.2"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<mocha>, ["= 0.9.12"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<mongo>, ["~> 1.2"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<mocha>, ["= 0.9.12"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end
