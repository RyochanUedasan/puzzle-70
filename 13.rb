# スマート（再帰含む）に解く方法わからず
#
# S - W <= 2
# R, W, T, S != 0
# D + E + K = L >= 3

def digits_to_number(digits)
  digits.map(&:to_s).inject(&:+).to_i
end

def solve
  count = 0

  10.times do |s|
    next if s == 0

    [s - 1, s - 2].each do |w|
      next if w <= 0

      set = 10.times.to_a

      set.delete(s)
      set.delete(w)

      set.each do |r|
        next if r == 0

        set2 = set.dup
        set2.delete(r)

        set2.each do |e|
          set3 = set2.dup
          set3.delete(e)

          set3.each do |a|
            set4 = set3.dup
            set4.delete(a)

            set4.each do |d|
              set5 = set4.dup
              set5.delete(d)

              set5.each do |i|
                set7 = set5.dup
                set7.delete(i)

                set7.each do |t|
                  next if t == 0

                  set8 = set7.dup
                  set8.delete(t)

                  set8.each do |l|
                    set9 = set8.dup
                    set9.delete(l)
                    k = set9.first
                    ok = digits_to_number([r, e, a, d]) +
                         digits_to_number([w, r, i, t, e]) +
                         digits_to_number([t, a, l, k]) ==
                         digits_to_number([s, k, i, l, l])
                    p [r, e, a, d, w, r, i, t, e, t, a, l, k, s, k, i, l, l] if ok
                    count += 1 if ok
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  count
end

p solve
