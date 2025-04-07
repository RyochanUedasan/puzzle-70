arr = Array.new(100, true) # index: 0~99, 裏向き: true

def p_ans(arr)
  # arrayの使い方わからない
  p(arr.map.with_index.filter_map { |v, i| i + 1 if v })
end

# index周りの書き方迷った
(2..100).each do |i|
  cur = -1
  while true
    cur += i

    break if cur > 99

    arr[cur] = !arr[cur]
  end
end

p_ans arr
