# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bson}
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jim Menard", "Mike Dirolf", "Kyle Banker"]
  s.date = %q{2011-09-20}
  s.description = %q{A Ruby BSON implementation for MongoDB. For more information about Mongo, see http://www.mongodb.org. For more information on BSON, see http://www.bsonspec.org.}
  s.email = %q{mongodb-dev@googlegroups.com}
  s.executables = ["b2json", "j2bson"]
  s.files = ["bin/b2json", "bin/j2bson"]
  s.homepage = %q{http://www.mongodb.org}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Ruby implementation of BSON}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
