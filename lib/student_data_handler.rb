require 'csv'

class StudentDataHandler

  STUDENT_DATA_FILE = File.expand_path('../../data/student_tests.csv', __FILE__)

  def initialize
    @student_data = Hash.new
  end

  def get_student_data
    student_data_index = parse_student_test_data
  end

  def parse_student_test_data
    CSV.foreach(STUDENT_DATA_FILE, headers: true) do |row|
      row_data = row.to_hash
      write_altered_student_data_hash(row_data)
    end
    @student_data
  end

  def write_altered_student_data_hash row_data
    student_scores = Hash.new
    student_scores_array = combine_domain_grade_and_domain(row_data)
    student_name = row_data.values[0]
    @student_data[student_name] = student_scores_array
  end

  def combine_domain_grade_and_domain row_data
    student_scores_array = Array.new
    domain = row_data.keys
    domain_grade = row_data.values
    index = 1
    while index < domain_grade.length
      student_scores_array << "#{domain_grade[index]}.#{domain[index]}"
      index += 1
    end
    student_scores_array
  end

end
