require_relative "Employee.rb"
require "byebug"


class Manager < Employee

    attr_reader :reports

    def initialize(title,salary,boss)
        super
        @reports = []

    end 

    def bonus(multiplier)
        bonus = 0 
        queue = @reports.dup
        until queue.empty?
            
            current = queue.shift 

            if current.is_a?(Manager)
                bonus += (current.salary * multiplier)

                queue.concat(current.reports)
            else 
                bonus += (current.salary * multiplier)
            end
        end 
        bonus
    end 

end 







