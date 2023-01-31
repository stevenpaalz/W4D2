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
      result = []
      @sub_employees.each do |employee|
        if !employee.is_a?(Manager)
          result << employee
        else
          result << employee
          result += employee.get_sub_employees
        end
      end
      result
    end
  
    def sub_salaries
      total_salaries = 0
      get_sub_employees.each do |employee|
        total_salaries += employee.salary
      end
      total_salaries
    end
  end