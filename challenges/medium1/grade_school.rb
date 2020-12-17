class School
  def initialize
    @students = Hash.new { |roster, grade| roster[grade] = [] }
  end
  
  def add(student, grade)
    students[grade] << student
  end
  
  def grade(grade)
    students[grade]
  end
  
  def to_h
    students.each { |k,v| v.sort! }
    students.sort.to_h
  end
  
  private
  
  attr_reader :students
end