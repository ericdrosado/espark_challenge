require_relative '../lib/domain_order_handler'
require_relative '../lib/student_data_handler'
require_relative '../lib/data_handler'

describe 'LearningPathGenerator' do

  domain_order_handler = DomainOrderHandler.new
  student_data_handler = StudentDataHandler.new
  data_handler = DataHandler.new(domain_order_handler, student_data_handler)

  describe '#get_student_learning_domains' do

    after {data_handler.get_student_learning_domains}

    it 'will receive get_learning_domains from domain_order_handler' do
      expect(domain_order_handler).to receive(:get_learning_domains)
    end
    it 'will receive get_student_data from student_data_handler' do
      expect(student_data_handler).to receive(:get_student_data)
    end

  end

end
