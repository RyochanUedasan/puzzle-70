# 簡単
STEPS = 10

def count(a_position, b_position)
  return 0 if a_position > b_position
  return 1 if a_position == b_position

  (1..4).sum do |a_diff|
    (1..4).sum do |b_diff|
      count(a_position + a_diff, b_position - b_diff)
    end
  end
end

p count(0, STEPS)
