require 'date'

def satisfied?(date)
  n = date.strftime('%Y%m%d').to_i
  n == n.to_s(2).reverse.to_i(2)
end

def solve
  (Date.new(1964, 10, 10)..Date.new(2020, 7, 24)).filter_map do |date|
    satisfied?(date) ? date : nil
  end
end

puts solve

# p satisfied?(Date.new(1966, 7, 13))
