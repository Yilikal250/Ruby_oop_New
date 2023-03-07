class Person
  attr_accessor :id, name, age

  def can_use_services?
    return unless age == 18 && parent_permission == true

    true
  end

  private

  def of_age?
    return false if age <= 18

    true
  end
end
