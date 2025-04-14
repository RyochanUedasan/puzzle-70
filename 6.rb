def modify(n)
  return n / 2 if n.even?

  n * 3 + 1
end

def infinite?(i)
  set = Set.new
  current = i * 3 + 1

  while true
    current = modify(current)

    break false if current == i # 初期値に戻る
    break true if set.add?(current).nil? # 初期値に戻らず、別の場所でループに突入
  end
end

p((2..10_000).step(2).count { !infinite?(_1) })
