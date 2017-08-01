require_relative 'domain_order_handler'
require_relative 'student_data_handler'
require_relative 'data_handler'
require_relative 'csv_writer'

class LearningPathGenerator

  def initialize data_handler, csv_writer
    @data_handler = data_handler
    @csv_writer = csv_writer
  end

  def generate_learning_path
    student_learning_domains = @data_handler.get_student_learning_domains
    @csv_writer.write_to_csv_file(student_learning_domains)
  end

end

domain_order_handler = DomainOrderHandler.new
student_data_handler = StudentDataHandler.new
data_handler = DataHandler.new(domain_order_handler, student_data_handler)
csv_writer = CSVWriter.new
learning_path_generator = LearningPathGenerator.new(data_handler, csv_writer)
learning_path_generator.generate_learning_path
