require_relative '../lib/student_data_handler'

describe 'StudentDataHandler' do

  student_data_handler = StudentDataHandler.new
  let(:result) {{"Albin Stanton"=>["2.RF", "3.RL", "K.RI", "3.L"], "Erik Purdy"=>["3.RF", "1.RL", "1.RI", "1.L"], "Aimee Cole"=>["K.RF", "K.RL", "1.RI", "2.L"], "Frederik Schulist"=>["2.RF", "4.RL", "4.RI", "4.L"], "Addie Green"=>["2.RF", "3.RL", "K.RI", "1.L"], "Missouri Auer"=>["4.RF", "2.RL", "1.RI", "1.L"], "Christopher Hayes"=>["5.RF", "5.RL", "K.RI", "2.L"], "Enos Jacobi"=>["K.RF", "K.RL", "4.RI", "5.L"], "Conrad Nitzsche"=>["1.RF", "5.RL", "K.RI", "3.L"], "Jazlyn Wisoky"=>["4.RF", "3.RL", "5.RI", "3.L"], "Kelley Emard"=>["K.RF", "2.RL", "K.RI", "4.L"], "Dell Kozey"=>["K.RF", "4.RL", "3.RI", "2.L"], "Kraig Goldner"=>["5.RF", "4.RL", "2.RI", "3.L"], "Stephon Ondricka"=>["5.RF", "5.RL", "3.RI", "K.L"], "Tracey Lind"=>["K.RF", "1.RL", "3.RI", "1.L"], "Elissa Schinner"=>["5.RF", "3.RL", "1.RI", "4.L"], "Orpha Bartoletti"=>["1.RF", "3.RL", "2.RI", "K.L"], "Timmothy Torphy"=>["K.RF", "1.RL", "K.RI", "1.L"], "Maia Torphy"=>["K.RF", "3.RL", "2.RI", "1.L"], "Danyka Pfeffer"=>["5.RF", "5.RL", "5.RI", "2.L"], "Leo O'Connell"=>["3.RF", "K.RL", "K.RI", "1.L"], "Scotty Kovacek"=>["K.RF", "3.RL", "3.RI", "1.L"], "Cameron Prohaska"=>["2.RF", "4.RL", "2.RI", "4.L"], "Angus Torp"=>["2.RF", "4.RL", "5.RI", "1.L"], "Douglas Feil"=>["1.RF", "1.RL", "1.RI", "K.L"], "Maxime Runte"=>["2.RF", "K.RL", "4.RI", "K.L"], "Mortimer Denesik"=>["K.RF", "K.RL", "2.RI", "3.L"], "Bennett Muller"=>["5.RF", "5.RL", "5.RI", "1.L"], "Ayana Runolfsson"=>["K.RF", "2.RL", "5.RI", "2.L"], "Angelina Runolfsson"=>["K.RF", "3.RL", "1.RI", "1.L"]}}

  describe '#get_student_data' do

    it 'will receive parse_student_test_data from StudentDataHandler' do
      expect(student_data_handler).to receive(:parse_student_test_data)
      student_data_handler.get_student_data
    end
    it 'will return student_data' do
      expect(student_data_handler.get_student_data).to eq result
    end

  end

  describe '.parse_student_test_data' do

    it 'will parse file contents and return result with a collection of student data hashes' do
      expect(student_data_handler.parse_student_test_data).to eq result
    end

  end

  describe '.write_altered_student_data_hash' do

    let(:row) {{"Student Name"=>"Albin Stanton", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"}}
    let(:row_result) {["2.RF", "3.RL", "K.RI", "3.L"]}

    it 'will take row_data in CSV file that was turned into a hash and alter it to combine student grade with domain' do
      expect(student_data_handler.write_altered_student_data_hash(row)).to eq row_result
    end

  end

  describe '.combine_domain_grade_and_domain' do

    let(:row) {{"Student Name"=>"Albin Stanton", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"}}
    let(:row_result) {["2.RF","3.RL","K.RI","3.L"]}

    it 'will combine grade level information with domain' do
      expect(student_data_handler.combine_domain_grade_and_domain(row)).to eq row_result
    end

  end

end
