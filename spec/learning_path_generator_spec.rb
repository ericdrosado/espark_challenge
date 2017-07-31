require_relative '../lib/csv_handler'
require_relative '../lib/data_handler'
require_relative '../lib/learning_path_generator'

describe 'LearningPathGenerator' do

  data_handler = DataHandler.new
  csv_handler = CSVHandler.new
  learning_path_generator = LearningPathGenerator.new(data_handler, csv_handler)

  describe '#generate_learning_path' do

    after {learning_path_generator.generate_learning_path}

    it 'will receive get_student_learning_domains from data_handler' do
      expect(data_handler).to receive(:get_student_learning_domains)
    end
    it 'will receive write_csv_file from csv_handler' do
      expect(csv_handler).to receive(:write_csv_file)
    end

  end

end
