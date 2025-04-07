def count(n, m)
  return 0 if n == 1

  count(n - [n / 2, m].min, m) + 1
end

p count(20, 3)
p count(100, 5)
