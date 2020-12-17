class Garden
  PLANTS = %w(Grass Clover Radishes Violets)
  STUDENTS = [
    'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet',
    'Ileana', 'Joseph', 'Kincaid', 'Larry'
  ]
  
  def initialize(garden, students = STUDENTS)
    @garden = garden.split("\n").map(&:chars)
    student_methods(students.sort)
  end

  def student_methods(students)
    students.map(&:downcase).each_with_index do |student, i|
      define_singleton_method(student) do
        [0, 1].repeated_permutation(2).map do |m,n|
          @garden[m][(i * 2) + n]
        end.map { |c| PLANTS.select { |p| p[0] == c }[0].downcase.to_sym }
      end
    end
  end
end