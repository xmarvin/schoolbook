# encoding: utf-8

def read_content i
  File.open(File.expand_path("git/book_#{i}.htm", File.dirname(__FILE__))).read
end

#User.create!(:email => "user@mailinator.com", :password=>"qweqwe")
User.destroy_all
Book.destroy_all
Exam.destroy_all
Image.destroy_all
BaseTest.destroy_all

User.create!(:email => "admin@mailinator.com", :password=>"qweqwe", :admin => true)
@book = Book.create!(:title => 'GIT', :description => File.open(File.expand_path("git/about.htm", File.dirname(__FILE__))).read)

@book.dict_items.create!(:tip => 'система контроля версия', :word => 'git')

Dir["db/git/images/*.*"].each { |file|
  @book.images.create!(:image => File.open("./"+file))

}

root = @book.chapters.create!(:title => 'About', :pos => 1, :content => read_content(1))
        root.option_tests.create!(:question => "Существуют ли внешние визуальные утилиты для работы с ГИТ?",
                          :options => [Option.new(:title => "SVN"), Option.new(:title => "Нет"),
                                       Option.new(:title => "Да", :correct => true)
                          ])
root.option_tests.create!(:question => "Зачем нужен GIT?",
                          :options => [Option.new(:title => "Для разработки"), Option.new(:title => "Для тестирования"),
                                       Option.new(:title => "Для хранения кода", :correct=> true)
                          ])
root.option_tests.create!(:question => "Что тут лишние?",
                          :options => [Option.new(:title => "SVN"), Option.new(:title => "Mercurial"),
                                       Option.new(:title => "IDEA IDE", :correct => true)
                          ])

ch2 = @book.chapters.create!(:title => 'Installation', :pos => 2, :chapter => root, :content => read_content(2))
ch3 = @book.chapters.create!(:title => 'Configuration', :pos => 3, :chapter => root, :content => read_content(3))
ch3.option_tests.create!(:question => "Где лежит конфигурационный файл ГИТ?",
                         :options => [Option.new(:title => "в корне диска"),
                                      Option.new(:title => "в корне домашнего каталога",:correct => true),
                                      Option.new(:title => "в корне проекта", :correct => true)
                         ])
ch3.text_tests.create!(:question => "Как называется конфигурационный файл ГИТ?",
                       :answer => ".gitconfig")

ch4 = @book.chapters.create!(:title => 'changes', :pos => 4, :chapter => root, :content => read_content(4))


ch5 = @book.chapters.create!(:title => 'commits',:pos => 5, :chapter => ch4, :content => read_content(5))


ch7 = @book.chapters.create!(:title => 'rebase', :pos => 6, :chapter => ch5, :content => read_content(7))
ch6 = @book.chapters.create!(:title => 'backup', :pos => 7, :chapter => ch5, :content => read_content(6))


ch6.option_tests.create!(:question =>"Вы добавили несколько файлов и выполнилb git add. Как можно отменить добавление?",
                          :options => [Option.new(:title => "$ git checkout origin/master"),
                                       Option.new(:title => "$ git checkout master"), Option.new(:title => "git reset HEAD", :correct=> true)
                          ])

ch6.option_tests.create!(:question => "Пусть A, B, C, D — четыре последовательных коммита, где В отличается от A лишь несколькими удаленными файлами. Мы хотим вернуть эти файлы в D. Как мы можем это сделать?",
                          :options => [Option.new(:title => "git checkout origin/master"),
                                       Option.new(:title => "$ git diff B A | git apply", :correct=> true), Option.new(:title => "C", :correct=> true),Option.new(:title => "git revert B", :correct=> true),
                          ])

ch8 = @book.chapters.create!(:title => 'branches', :pos => 8, :chapter => ch4, :content => read_content(8))


ch9 = @book.chapters.create!(:title => 'diff', :pos => 9, :chapter => ch8, :content => read_content(9))

ch9.text_tests.create!(:question => "Как называется команда позволяющая узнать, кто автор конкретной строчки в файле?",
                       :answer => "blame")
 ch9.text_tests.create!(:question => "Вы хотите узнать, что было изменено в ветке develop, перед тем, как выполнить слияние с ней. что следует ввести?",
                       :answer => "git diff origin/develop")

ch10 = @book.chapters.create!(:title => 'resolve conflicts', :pos => 10, :chapter => ch8, :content => read_content(10))


ch11 = @book.chapters.create!(:title => 'external', :pos => 11,:chapter => ch2, :content => read_content(11))
