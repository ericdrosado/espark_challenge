require_relative '../lib/csv_writer'
require 'csv'

describe 'CSVWriter' do

  csv_writer = CSVWriter.new

  describe 'write_to_csv_file' do

    let(:student_learning_domains) {["Albin Stanton,K.RI,1.RI,2.RF,2.RI,3.RF","Erik Purdy,1.RL,1.RI,2.RI,2.RL,2.L","Aimee Cole,K.RF,K.RL,1.RF,1.RL,1.RI"]}

    it 'will write student_learning_domains to csv file' do
      csv_writer.write_to_csv_file(student_learning_domains)
      solution = [["Albin Stanton", "K.RI", "1.RI", "2.RF", "2.RI", "3.RF"], ["Erik Purdy", "1.RL", "1.RI", "2.RI", "2.RL", "2.L"], ["Aimee Cole", "K.RF", "K.RL", "1.RF", "1.RL", "1.RI"]]
      expect(solution).to eq CSV.read('solution.csv')
    end

  end

end
