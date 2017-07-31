class LearningPathGenerator

  def initialize data_handler, csv_handler
    @data_handler = data_handler
    @csv_handler = csv_handler
  end

  def generate_learning_path
    student_learning_domains = @data_handler.get_student_learning_domains
    @csv_handler.write_csv_file(student_learning_domains)
  end

end

data_handler = DataHandler.new
csv_handler = CSVHandler.new
learning_path_generator = LearningPathGenerator.new(data_handler, csv_handler)
learning_path_generator.generate_learning_path
