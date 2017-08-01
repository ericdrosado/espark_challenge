require 'csv'

class CSVWriter

  def write_to_csv_file student_learning_domains
    CSV.open("solution.csv", "w") do |csv|
      student_learning_domains.each { |x| csv << [x] }
    end
  end

end
