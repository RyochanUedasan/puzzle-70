# fibonacciのStreamみたいの作れる？
# FibonacciStream.take(5) { |n| n.dividable? }
def dividable?(n)
  (n % n.to_s.chars.map(&:to_i).inject(:+)).zero?
end

def solve
  previous2 = 1
  previous = 2
  ans = []

  while true
    break if ans.size == 5

    current = previous2 + previous
    previous2 = previous
    previous = current

    ans.append(current) if dividable?(current) && 144 < current
  end
  ans
end

p solve
