require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  OPERATIONS = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person_id,
    7 => :exit
  }.freeze

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      menu
      option = gets.chomp.to_i
      operation = OPERATIONS[option]
      if operation == :exit
        break
      elsif operation
        send(operation)
      else
        puts 'That is not a valid input'
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'That is not a valid input'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    student = Student.new(age, name, parent_permission)
    puts 'Person created successfully'
    @people.push(student)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    @people.push(teacher)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created successfully'
    @books.push(book)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless @rentals.include?(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.select do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
