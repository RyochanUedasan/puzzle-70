# 合成数を求めるとかいらない気がしてくる
# 17 * 19 => もっと小さい
# 解説見る、最初と最後を平方数に -> 13 * 13
# わからん => 解答見て、納得

require 'prime'

# class CompositeNumbers
#   include Enumerable

#   def initialize
#     @memo = [4]
#   end

#   def each
#     (0..).each do |i|
#       @memo[i] ||= next_composite_number(i - 1 >= 0 ? @memo[i - 1] : 1)
#       yield @memo[i]
#     end
#   end

#   def next_composite_number(n)
#     ((n + 1)..).each do |i|
#       return i unless Prime.prime?(i)
#     end
#   end
# end

def solve
  ans_arr = []
  ans_n = 1_000_000
  Prime.take(6).permutation.each do |a, b, c, d, e, f|
    arr = [a * a, a * b, b * c, c * d, d * e, e * f, f * f]
    max = arr.max

    if max < ans_n
      ans_arr = arr
      ans_n = max
    end
  end
  [ans_arr, ans_n]
end

p solve
