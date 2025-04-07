def solve(n)
  count = 0

  (0..15).each do |c10|
    (0..(15 - c10)).each do |c50|
      (0..(15 - c50 - c10)).each do |c100|
        (0..(15 - c100 - c50 - c10)).each do |c500|
          count += 1 if c10 * 10 + c50 * 50 + c100 * 100 + c500 * 500 == 1000
        end
      end
    end
  end

  count
end

p solve(1000)
