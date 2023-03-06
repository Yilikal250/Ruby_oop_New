class Person
    attr_accessor :id,name,age

    def initialize(name="Unknown",age,parent_permission:true)
        
    end

    private
  def is_of_age?
    if age <= 18
     return false
    end    
    return true
  end

  def can_use_services?
    if age == 18 && parent_permission == true
        return true
    end    
  end  
end