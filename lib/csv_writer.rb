require 'csv'

class CSVWriter

  def write_to_csv_file student_learning_domains
    CSV.open("solution.csv", "wb") do |csv|
      student_learning_domains.each do |row|
        csv << row.split(',')
      end
    end
  end

end
