class DataHandler

  def initialize domain_order_handler, student_data_handler
    @domain_order_handler = domain_order_handler
    @student_data_handler = student_data_handler
  end

  def get_student_learning_domains
    learning_domains = @domain_order_handler.get_learning_domains
    student_data = @student_data_handler.get_student_data
  end

end
