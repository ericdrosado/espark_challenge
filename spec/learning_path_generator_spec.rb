require_relative '../lib/csv_writer'
require_relative '../lib/data_handler'
require_relative '../lib/learning_path_generator'

describe 'LearningPathGenerator' do

  domain_order_handler = DomainOrderHandler.new
  student_data_handler = StudentDataHandler.new
  data_handler = DataHandler.new(domain_order_handler, student_data_handler)
  csv_writer = CSVWriter.new
  learning_path_generator = LearningPathGenerator.new(data_handler, csv_writer)

  describe '#generate_learning_path' do

    before { csv_writer.stub(:write_to_csv_file) }
    after {learning_path_generator.generate_learning_path}

    it 'will receive get_student_learning_domains from data_handler' do
      expect(data_handler).to receive(:get_student_learning_domains)
    end
    it 'will receive write_to_csv_file from csv_writer' do
      expect(csv_writer).to receive(:write_to_csv_file)
    end

  end

end
