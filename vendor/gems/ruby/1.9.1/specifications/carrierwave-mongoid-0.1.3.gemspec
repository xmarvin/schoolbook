# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{carrierwave-mongoid}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonas Nicklas", "Trevor Turk"]
  s.date = %q{2011-09-22}
  s.description = %q{Mongoid support for CarrierWave}
  s.email = ["jonas.nicklas@gmail.com"]
  s.homepage = %q{https://github.com/jnicklas/carrierwave-mongoid}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{carrierwave-mongoid}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Mongoid support for CarrierWave}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<carrierwave>, [">= 0.5.6"])
      s.add_runtime_dependency(%q<mongoid>, ["~> 2.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<bson_ext>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<mini_magick>, [">= 0"])
    else
      s.add_dependency(%q<carrierwave>, [">= 0.5.6"])
      s.add_dependency(%q<mongoid>, ["~> 2.1"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<bson_ext>, ["~> 1.3"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
    end
  else
    s.add_dependency(%q<carrierwave>, [">= 0.5.6"])
    s.add_dependency(%q<mongoid>, ["~> 2.1"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<bson_ext>, ["~> 1.3"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
  end
end
