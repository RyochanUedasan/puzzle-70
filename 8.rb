def count(field, current, remaining)
  return 1 if remaining == 0

  [[0, 1], [0, -1], [1, 0], [-1, 0]].map do |dx, dy|
    x = current[0] + dx
    y = current[1] + dy
    next 0 if field[x][y]

    dup_field = field.map(&:dup)
    dup_field[x][y] = true

    count(dup_field, [x, y], remaining - 1)
  end.sum
end

def solve(n)
  field = Array.new(n * 2 + 1) { Array.new(n * 2 + 1, false) }
  current = [n, n]
  field[current[0]][current[1]] = true
  count(field, current, n)
end

p solve(12)
