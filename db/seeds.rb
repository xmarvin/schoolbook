# encoding: utf-8

def read_content i
  File.open(File.expand_path("git/book_#{i}.htm", File.dirname(__FILE__))).read
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create!(:email => "admin@mailinator.com", :password=>"qweqwe", :admin => true)
#User.create!(:email => "user@mailinator.com", :password=>"qweqwe")
   Book.destroy_all
   Exam.destroy_all
   Image.destroy_all
   BaseTest.destroy_all
@book = Book.create!(:title => 'GIT')

Dir["db/git/images/*.*"].each {|file|
  @book.images.create!(:image => File.open("./"+file))

  }

root = @book.chapters.create!(:title => 'About',:content => read_content(1))

root.option_tests.create!(:question => "Зачем нужен GIT?",
                          :options => [Option.new(:title => "Для разработки"), Option.new(:title => "Для тестирования"),
                          Option.new(:title => "Для хранения кода", :correct=> true)
                          ])
 root.option_tests.create!(:question => "Что тут лишние?",
                          :options => [Option.new(:title => "SVN"),Option.new(:title => "Mercurial"),
                          Option.new(:title => "IDEA IDE", :correct => true)
                          ])
ch2 = @book.chapters.create!(:title => 'Installation', :chapter => root,  :content => read_content(2))
ch3 = @book.chapters.create!(:title => 'Configuration', :chapter => root, :content => read_content(3))

ch4 = @book.chapters.create!(:title => 'changes', :chapter => root,  :content => read_content(4))


ch5 = @book.chapters.create!(:title => 'commits', :chapter => ch4,  :content => read_content(5))



ch7 = @book.chapters.create!(:title => 'rebase', :chapter => ch5,  :content => read_content(7))
ch6 = @book.chapters.create!(:title => 'backup', :chapter => ch5, :content => read_content(6))



ch8 = @book.chapters.create!(:title => 'branches', :chapter => ch4,  :content => read_content(8))


ch9 = @book.chapters.create!(:title => 'diff', :chapter => ch8,  :content => read_content(9))

ch10 = @book.chapters.create!(:title => 'resolve conflicts', :chapter => ch8,  :content => read_content(10))


ch11 = @book.chapters.create!(:title => 'external', :chapter => ch2,  :content => read_content(11))
