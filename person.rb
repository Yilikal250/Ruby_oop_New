require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# capitalizedTrimmedPerson.correct_name
