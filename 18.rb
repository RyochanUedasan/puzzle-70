# Nを動かすことになる
# 作ることのできる平方数はN + (N - 1)以下に限られる
# => (3,6) (5,4) とかって同じ平方数も作れるわな
# permutation遅すぎ

# 遅すぎ
# # @return Array[Integer]
# def find_cuttable_arr(piece_count, square_numbers)
#   sn_set = square_numbers.take_while { _1 < piece_count + (piece_count - 1) }

#   (1..piece_count).to_a.permutation.each do |arr|
#     return arr if (0..(piece_count - 1)).all? do |i|
#       sum = arr[i] + arr[(i + 1) % piece_count]
#       sn_set.include?(sum)
#     end
#   end

#   []
# end

# def solve
#   square_numbers = SquareNumbers.new

#   (2..).each do |piece_count|
#     cuttable_arr = find_cuttable_arr(piece_count, square_numbers)

#     unless cuttable_arr.empty?
#       p cuttable_arr
#       return piece_count
#     end
#   end
# end

class SquareNumbers
  include Enumerable

  def initialize
    @memo = []
  end

  def each
    (1..).each do |i|
      @memo[i - 1] ||= i * i
      yield @memo[i - 1]
    end
  end
end

def find_next_strawberries(current_strawberry, remainings, square_numbers)
  return [current_strawberry] if remainings.empty? && square_numbers.include?(current_strawberry + 1) # 1は初回のイチゴ

  remainings.each do |remaining|
    next unless square_numbers.include?(current_strawberry + remaining)

    finded = find_next_strawberries(remaining, remainings - [remaining], square_numbers)
    return finded + [current_strawberry] unless finded.empty?
  end

  []
end

def solve
  (2..).each do |piece_count|
    square_numbers = SquareNumbers.new.take_while { _1 < piece_count + (piece_count - 1) }
    strawberries = find_next_strawberries(1, (1..piece_count).to_a - [1], square_numbers)

    unless strawberries.empty?
      p strawberries
      return piece_count
    end
  end
end

p solve
