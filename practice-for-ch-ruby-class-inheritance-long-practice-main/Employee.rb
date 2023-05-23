

class Employee 

    def initialize(title, salary, boss)
        @title = title
        @salary = salary 
        @boss = boss 
    end 

    def bonus(multiplier)
        bonus = @salary * multiplier
    end 

end 