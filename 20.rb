magic_square_numbers = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]

hash = Hash.new(0)

# 16c1 + 16c2 + ... + 16c15 + 16c16
# 16c8 = 10000くらい？
(1..magic_square_numbers.size).each do |size| # 16
  magic_square_numbers.combination(size).each do |combi| # 16csize
    key = combi.inject(:+)
    hash[key] = hash[key] + 1
  end
end

p(hash.max_by { |k, v| v })
