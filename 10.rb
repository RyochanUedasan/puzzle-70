EUROPEAN_NUMBERS = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14,
                    31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
AMERICAN_NUMBERS = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0o0, 27, 10, 25, 29, 12, 8,
                    19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

def circluar_take(arr, n, start)
  arr_size = arr.size
  taken = []
  (start...(start + n)).each do |i|
    taken.append(arr[i % arr_size])
  end
  taken
end

def count_max(arr, n)
  max = 0
  arr.size.times do |start|
    max = [circluar_take(arr, n, start).sum, max].max
  end
  max
end

def solve
  (2..36).filter_map do |n|
    count_max(EUROPEAN_NUMBERS, n) < count_max(AMERICAN_NUMBERS, n) ? n : nil
  end
end

p solve
