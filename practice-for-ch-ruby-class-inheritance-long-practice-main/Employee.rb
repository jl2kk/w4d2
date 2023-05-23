

class Employee 


    attr_reader :salary

    def initialize(title, salary, boss)
        @title = title
        @salary = salary 
        @boss = boss 
        set_boss
    end 

    def set_boss
        unless @boss == nil 
            @boss.reports << self
        end 
    end


    def bonus(multiplier)
        bonus = @salary * multiplier
    end 

end 