require_relative "Employee.rb"


class Manager < Employee

    def initialize(title,salary,boss)
        super
        @reports = []

    end 

    def bonus(multiplier)
        bouns = 0 
        queue = @reports 
        until queue.empty?
            current = queue.shift 

            if current.class.is_a(Manager)

                bonus += (current.salary * multiplier) 

                queue.concat(current.reports)
            else 

            end
        end 
    end 
end 







