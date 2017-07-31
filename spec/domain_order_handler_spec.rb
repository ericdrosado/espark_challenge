require_relative '../lib/domain_order_handler'

describe 'DomainOrderHandler' do

  domain_order_handler = DomainOrderHandler.new
  let(:result) {['K.RF','K.RL','K.RI','1.RF','1.RL','1.RI','2.RF','2.RI','2.RL','2.L','3.RF','3.RL','3.RI','3.L','4.RI','4.RL','4.L','5.RI','5.RL','5.L','6.RI','6.RL']}

  describe '#get_learning_domains' do

    it 'will receive parse_domain_order from DomainOrderHandler' do
      expect(domain_order_handler).to receive(:parse_domain_order)
      domain_order_handler.get_learning_domains
    end
    it 'will return domain_order_index' do
      expect(domain_order_handler.get_learning_domains).to eq result
    end

  end

  describe '.parse_domain_order' do

    it 'will parse file contents and return result with altered domain order content (ex. grade.domain)' do
      expect(domain_order_handler.parse_domain_order).to eq result
    end

  end

  describe '.combine_grade_level_and_domain' do

    let(:row) {['K','RF','RL','RI']}
    let(:grade_domain_result) {['K.RF','K.RL','K.RI']}

    it 'will combine grade level information with domain' do
      expect(domain_order_handler.combine_grade_level_and_domain(row)).to eq grade_domain_result
    end

  end

end
