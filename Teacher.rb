class Teacher < Person
    attattr_accessor :@specialization
    def initialize(classroom,name,age,parent_permission,specialization)
        @specialization=specialization
        super(classroom,name,age,parent_permission)
    end
    def can_use_services?
        return true
    end
end