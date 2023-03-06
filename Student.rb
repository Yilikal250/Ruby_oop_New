class Student < Person
    attattr_accessor :@classroom
    def initialize(classroom,name,age,parent_permission)
        @classroom=classroom
        super(name,age,parent_permission)
    end

    def play_hooky
        
        return "¯\(ツ)/¯"
    end
end