class Employee

    attr_reader :salary, :title, :name, :boss

    def initialize(name, salary, title, boss = nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee

    def initialize(name, salary, title, sub_employees, boss = nil)
        super(name, salary, title, boss)
        @sub_employees = sub_employees
    end

    def bonus(multiplier)
        multiplier * sub_salaries
    end

    protected

    def get_sub_employees
        
    end

    def sub_salaries



        
        total_salaries = 0
        @sub_employees.each do |employee|
            if employee.is_a? (Manager)
                employee.sub_employees
            total_salaries += employee.salary
        end
        total_salaries
    end
end