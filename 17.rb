# 女子は何人いてもいいの？

# n人並び、一番右が男子の並び方の総数: dp_man[n]通り
# n人並び、一番右が女子の並びかたの総数: dp_woman[n]通り

HEAD_COUNT = 30

def solve
  dp_man = Array.new(HEAD_COUNT, 1)
  dp_woman = Array.new(HEAD_COUNT, 1)

  (1...HEAD_COUNT).each do |i|
    dp_man[i] = dp_woman[i - 1] + dp_man[i - 1]
    dp_woman[i] = dp_man[i - 1]
  end

  dp_man[HEAD_COUNT - 1] + dp_woman[HEAD_COUNT - 1]
end

p solve
