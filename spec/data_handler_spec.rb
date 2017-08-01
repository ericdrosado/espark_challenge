require_relative '../lib/domain_order_handler'
require_relative '../lib/student_data_handler'
require_relative '../lib/data_handler'

describe 'DataHandler' do

  domain_order_handler = DomainOrderHandler.new
  student_data_handler = StudentDataHandler.new
  data_handler = DataHandler.new(domain_order_handler, student_data_handler)

  let (:learning_domains) {["K.RF", "K.RL", "K.RI", "1.RF", "1.RL", "1.RI", "2.RF", "2.RI", "2.RL", "2.L", "3.RF", "3.RL", "3.RI", "3.L", "4.RI", "4.RL", "4.L", "5.RI", "5.RL", "5.L", "6.RI", "6.RL"]}

  describe '#get_student_learning_domains' do

    let(:result){["Albin Stanton,K.RI,1.RI,2.RF,2.RI,3.RF", "Erik Purdy,1.RL,1.RI,2.RI,2.RL,2.L", "Aimee Cole,K.RF,K.RL,1.RF,1.RL,1.RI", "Frederik Schulist,2.RF,3.RF,4.RI,4.RL,4.L", "Addie Green,K.RI,1.RI,2.RF,2.RI,2.L", "Missouri Auer,1.RI,2.RI,2.RL,2.L,3.RL", "Christopher Hayes,K.RI,1.RI,2.RI,2.L,3.RI", "Enos Jacobi,K.RF,K.RL,1.RF,1.RL,2.RF", "Conrad Nitzsche,K.RI,1.RF,1.RI,2.RF,2.RI", "Jazlyn Wisoky,3.RL,3.L,4.RL,4.L,5.RI", "Kelley Emard,K.RF,K.RI,1.RF,1.RI,2.RF", "Dell Kozey,K.RF,1.RF,2.RF,2.L,3.RF", "Kraig Goldner,2.RI,3.RI,3.L,4.RI,4.RL", "Stephon Ondricka,2.L,3.RI,3.L,4.RI,4.L", "Tracey Lind,K.RF,1.RF,1.RL,2.RF,2.RL", "Elissa Schinner,1.RI,2.RI,3.RL,3.RI,4.RI", "Orpha Bartoletti,1.RF,2.RF,2.RI,2.L,3.RF", "Timmothy Torphy,K.RF,K.RI,1.RF,1.RL,1.RI", "Maia Torphy,K.RF,1.RF,2.RF,2.RI,2.L", "Danyka Pfeffer,2.L,3.L,4.L,5.RI,5.RL", "Leo O'Connell,K.RL,K.RI,1.RL,1.RI,2.RI", "Scotty Kovacek,K.RF,1.RF,2.RF,2.L,3.RF", "Cameron Prohaska,2.RF,2.RI,3.RF,3.RI,4.RI", "Angus Torp,2.RF,2.L,3.RF,3.L,4.RL", "Douglas Feil,1.RF,1.RL,1.RI,2.RF,2.RI", "Maxime Runte,K.RL,1.RL,2.RF,2.RL,2.L", "Mortimer Denesik,K.RF,K.RL,1.RF,1.RL,2.RF", "Bennett Muller,2.L,3.L,4.L,5.RI,5.RL", "Ayana Runolfsson,K.RF,1.RF,2.RF,2.RL,2.L", "Angelina Runolfsson,K.RF,1.RF,1.RI,2.RF,2.RI"]}

    let(:dbl) { double }

    before do
      data_handler.stub(:get_domains_per_student)
      allow(dbl).to receive(:get_student_learning_domains).and_return(result)
    end

    after {data_handler.get_student_learning_domains}

    it 'will receive get_learning_domains from domain_order_handler' do
      expect(domain_order_handler).to receive(:get_learning_domains)
    end
    it 'will receive get_student_data from student_data_handler' do
      expect(student_data_handler).to receive(:get_student_data)
    end
    it 'will return an array of learning paths for each student' do
      expect(dbl.get_student_learning_domains).to eq result
    end

  end

  describe '.get_domains_per_student' do

    it 'will return an array containg five or less learning domains for each student' do
      student_data = {"Albin Stanton"=>["2.RF", "3.RL", "K.RI", "3.L"]}
      expect(data_handler.get_domains_per_student(student_data,learning_domains)).to eq ["Albin Stanton,K.RI,1.RI,2.RF,2.RI,3.RF"]
    end

  end

  describe '.pick_five_learning_domains' do

    it 'will return first five learning domains if there are no scores for student' do
      student_scores = []
      expect(data_handler.pick_five_learning_domains(student_scores, learning_domains)).to eq ["K.RF", "K.RL", "K.RI", "K.L", "1.RF"]
    end
    it 'will pick five learning domains and return them' do
      student_scores = ["2.RF", "3.RL", "K.RI", "3.L"]
      expect(data_handler.pick_five_learning_domains(student_scores, learning_domains)).to eq ["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]
    end

  end

  describe '.get_domain' do

    it 'will return a student score if it is equal to a single domain' do
      student_scores = ["2.RF", "3.RL", "K.RI", "3.L"]
      domain = "2.RF"
      expect(data_handler.get_domain(domain, student_scores)).to eq "2.RF"
    end
    it 'will return a domain if it is a necessary domain requirement for a student' do
      student_scores = ["2.RF", "3.RL", "K.RI", "3.L"]
      domain = "3.RF"
      expect(data_handler.get_domain(domain, student_scores)).to eq "3.RF"
    end
    it 'will return nil if the domain does not match or if it is not a necessary domain for the student' do
      student_scores = ["2.RF", "3.RL", "K.RI", "3.L"]
      domain = "K.RF"
      expect(data_handler.get_domain(domain, student_scores)).to eq nil
    end

  end

end
