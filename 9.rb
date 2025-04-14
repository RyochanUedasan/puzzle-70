def count(m, f, c)
  return 1 if m == 0 && f == 0 # 均等に分割できず並べおワッタ

  return 0 if c == 0 || m == f # 均等に分割できる場所あり

  count = 0
  count += count(m - 1, f, c + 1) if m != 0
  count += count(m, f - 1, c - 1) if f != 0
  count
end

def solve(m, f)
  count(m - 1, f, 1) + count(m, f - 1, -1)
end

p solve(20, 10)
