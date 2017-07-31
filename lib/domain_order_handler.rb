require 'csv'

class DomainOrderHandler

  DOMAIN_ORDER_FILE = File.expand_path('../../data/domain_order.csv', __FILE__)

  def get_learning_domains
    domain_order_index = parse_domain_order
  end

  def parse_domain_order
    domain_index = Array.new
    CSV.foreach(DOMAIN_ORDER_FILE) do |row|
      grade_domain = combine_grade_level_and_domain(row)
      domain_index.concat(grade_domain)
    end
    domain_index
  end

  def combine_grade_level_and_domain row
    grade_and_domain = Array.new
    index = 0
    grade_level = row[0]
    while index < row.length - 1
      domain = row[index+1]
      grade_and_domain[index] = "#{grade_level}.#{domain}"
      index += 1
    end
    grade_and_domain
  end

end
