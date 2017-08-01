class DataHandler

  def initialize domain_order_handler, student_data_handler
    @domain_order_handler = domain_order_handler
    @student_data_handler = student_data_handler
  end

  def get_student_learning_domains
    student_data = Hash.new
    learning_domains = @domain_order_handler.get_learning_domains
    student_data = @student_data_handler.get_student_data
    get_domains_per_student(student_data, learning_domains)
  end

  def get_domains_per_student student_data, learning_domains
    learning_domains_for_all_students = Array.new
    five_domains = Array.new
    index = 0
    while index < student_data.length
      student_scores = student_data.values[index]
      five_domains = pick_five_learning_domains(student_scores, learning_domains)
      learning_domains_for_all_students << "#{student_data.keys[index]},#{five_domains.join(",")}"
      index += 1
    end
    learning_domains_for_all_students
  end

  def pick_five_learning_domains student_scores, learning_domains
    if student_scores == []
      five_learning_domains = ['K.RF','K.RL','K.RI','K.L','1.RF']
    else
      index = 0
      five_learning_domains = Array.new
      while index < learning_domains.length && five_learning_domains.length != 5
        domain = learning_domains[index]
        if get_domain(domain, student_scores) != nil
          five_learning_domains << get_domain(domain, student_scores)
        end
        index += 1
      end
    end
    five_learning_domains
  end

  def get_domain domain, student_scores
    index = 0
    while index < student_scores.length
      case
      when domain == student_scores[index]
        return domain
      when domain.match(/[^.]+$/).to_s == student_scores[index].match(/[^.]+$/).to_s
        if domain.match(/^[^.]/).to_s == "K"
          break
        elsif domain.match(/^[^.]/).to_s.to_i > student_scores[index].match(/^[^.]/).to_s.to_i
          return domain
        end
      end
      index += 1
    end
  end

end
