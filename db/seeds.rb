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

User.create!(:email => "admin@mailinator.com", :name => "Alexey Kisel", :password=>"qweqwe", :admin => true, :superadmin => true)
@book = Book.create!(:title => 'GIT', :description => File.open(File.expand_path("git/about.htm", File.dirname(__FILE__))).read)

@book.dict_items.create!(:tip => 'система контроля версия', :word => 'git')
@book.dict_items.create!(:tip => 'Динамический, рефлективный, интерпретируемый высокоуровневый язык программирования для быстрого и удобного[1][2] объектно-ориентированного программирования. Язык обладает независимой от операционной системы реализацией многопоточности, строгой динамической типизацией, сборщиком мусора и многими другими возможностями. ', :word => 'Ruby')
@book.dict_items.create!(:tip => 'Ruby on Rails — Фреймворк , написанный на языке программирования Ruby ', :word => 'rails')
@book.dict_items.create!(:tip => 'распределенная система, предоставляющая доступ к связанным между собой документам, расположенным на различных компьютерах, подключенных к Интернету', :word => 'web')
@book.dict_items.create!(:tip => 'семейство переносимых, многозадачных и многопользовательских операционных систем', :word => 'unix')
@book.dict_items.create!(:tip => 'сетевой протокол сеансового уровня, позволяющий производить удалённое управление операционной системой и туннелирование TCP-соединений (например, для передачи файлов', :word => 'ssh')

Dir["db/git/images/*.*"].each { |file|
  @book.images.create!(:image => File.open("./"+file))

}

root = @book.chapters.create!(:title => 'About', :pos => 1, :content => read_content(1))
root.option_tests.create!(:question => "Существуют ли внешние визуальные утилиты для работы с ГИТ?",
                          :options => [ Option.new(:title => "Нет"),
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


root.text_tests.create!(:question => "Какой командой можно получить справку по системе?",
                       :level => 2,
                       :answer => "git help")

root.text_tests.create!(:question => "Какой командой можно получить список последних правок в проекте?",
                       :level => 2,
                       :answer => "git log")

root.text_tests.create!(:question => "Какой командой можно получить справку по комманде 'commit'?",
                       :level => 2,
                       :answer => "git help commit")

ch2 = @book.chapters.create!(:title => 'Installation', :pos => 2, :chapter => root, :content => read_content(2))


ch3 = @book.chapters.create!(:title => 'Configuration', :pos => 3, :chapter => root, :content => read_content(3))


ch3.option_tests.create!(:question => "Является ли ГИТ бесплатным ПО?",
                         :options => [Option.new(:title => "Нет"),
                                      Option.new(:title => "Да", :correct => true)
                         ])
ch3.option_tests.create!(:question => "Для каких ОС существуют реализации клиента GIT?",
                         :options => [
                             Option.new(:title => "только для Windows"),
                             Option.new(:title => "только для Linux & Mac OS"),
                             Option.new(:title => "только для Windows & Linux"),
                             Option.new(:title => "Для всех платформ", :correct => true)
                         ])

ch3.option_tests.create!(:question => "Какой шаг необходим сразу после инсталяции ГИТ?",
                         :options => [
                             Option.new(:title => "Зарегистрироваться на сайте github.com"),
                             Option.new(:title => "настроить собственный сервер с ГИТ"),

                             Option.new(:title => "сгенерировать SSH ключ.", :correct => true)
                         ])


ch3.option_tests.create!(:question => "Где лежит конфигурационный файл ГИТ?",
                         :level => 1,
                         :options => [Option.new(:title => "в корне диска"),
                                      Option.new(:title => "в корне домашнего каталога", :correct => true),
                                      Option.new(:title => "в корне проекта", :correct => true)
                         ])
ch3.option_tests.create!(:question => "Основные поля для идентификации разработчика - это:",
                         :level => 1,
                         :options => [Option.new(:title => "почта и имя", :correct => true),
                                      Option.new(:title => "skype и логин"),
                                      Option.new(:title => "телефон и имя")
                         ])
ch3.text_tests.create!(:question => "Как называется конфигурационный файл ГИТ?",
                       :level => 2,
                       :answer => ".gitconfig")

ch3.text_tests.create!(:question => "Как алгоритм хеширования используется для идентификации комитов?",
                       :level => 2,
                       :answer => "sha1")

ch4 = @book.chapters.create!(:title => 'changes', :pos => 4, :chapter => root, :content => read_content(4))


ch5 = @book.chapters.create!(:title => 'commits', :pos => 5, :chapter => ch4, :content => read_content(5))


ch5.option_tests.create!(:question =>"В ГИТ существует возможность выполнять комиты без удаленного сервера. ",
                         :options => [Option.new(:title => "нет"), Option.new(:title => "ДА", :correct=> true)
                         ])
ch5.option_tests.create!(:question =>"Как часто следует комитить изменения?",
                         :options => [Option.new(:title => "раз в день"),
                                      Option.new(:title => "перед опасными действиями"), Option.new(:title => "по задачно", :correct=> true)
                         ])

ch5.option_tests.create!(:question =>"Как бы вы закомители файл, не выполняя ранее команду git add?",
                         :options => [Option.new(:title => "git rebase -a"),
                                      Option.new(:title => "git commit"), Option.new(:title => "git commit -a", :correct=> true)
                         ])
ch5.option_tests.create!(:question =>"Для идентфикации коммитов используются",
                         :options => [Option.new(:title => "имена"),
                                      Option.new(:title => "дата"), Option.new(:title => " номера"), Option.new(:title => "хеш", :correct=> true)
                         ])
ch5.text_tests.create!(:question => "Текущее, последний коммит имеет идентификатор ...",
                       :answer => "HEAD", :level => 2)

ch5.text_tests.create!(:question => "Вы хотите стереть копирайт, в уже закомиченном файле, какой командой вы воспользуйтесь",
                       :answer => "git commit --amend", :level => 2)

ch7 = @book.chapters.create!(:title => 'rebase', :pos => 6, :chapter => ch5, :content => read_content(7))
ch6 = @book.chapters.create!(:title => 'backup', :pos => 7, :chapter => ch5, :content => read_content(6))



ch6.option_tests.create!(:question =>"Как можно отменить изменения?",
                         :options => [Option.new(:title => "$ git checkout origin/master"),
                                      Option.new(:title => "$ git checkout .", :correct=> true), Option.new(:title => "git reset HEAD")
                         ])

ch6.option_tests.create!(:question =>"Вы добавили несколько файлов и выполнилb git add. Как можно отменить добавление?",
                         :options => [Option.new(:title => "$ git checkout origin/master"),
                                      Option.new(:title => "$ git checkout master"), Option.new(:title => "git reset HEAD", :correct=> true)
                         ])

ch6.option_tests.create!(:question => "Пусть A, B, C, D — четыре последовательных коммита, где В отличается от A лишь несколькими удаленными файлами. Мы хотим вернуть эти файлы в D. Как мы можем это сделать?",
                         :options => [Option.new(:title => "git checkout origin/master"),
                                      Option.new(:title => "$ git diff B A | git apply", :correct=> true), Option.new(:title => "$ git rebase"), Option.new(:title => "git revert B", :correct=> true),
                         ])

ch8 = @book.chapters.create!(:title => 'branches', :pos => 8, :chapter => ch4, :content => read_content(8))


ch9 = @book.chapters.create!(:title => 'diff', :pos => 9, :chapter => ch8, :content => read_content(9))

ch9.option_tests.create!(:question => "Как узнать что было сделать в текущую сессию?",
                         :options => [Option.new(:title => "git diff", :correct => true),
                                      Option.new(:title => "$ git diff HEAD", :correct=> true), Option.new(:title => "$ git diff origin/HEAD")
                         ])

ch9.text_tests.create!(:question => "Как называется команда позволяющая узнать, кто автор конкретной строчки в файле?",
                       :answer => "blame", :level => 2)
ch9.text_tests.create!(:question => "Вы хотите узнать, что было изменено в ветке develop, перед тем, как выполнить слияние с ней. что следует ввести?",
                       :answer => "git diff origin/develop", :level =>2)

ch10 = @book.chapters.create!(:title => 'conflicts', :pos => 10, :chapter => ch8, :content => read_content(10))


ch11 = @book.chapters.create!(:title => 'external', :pos => 11, :chapter => ch2, :content => read_content(11))
