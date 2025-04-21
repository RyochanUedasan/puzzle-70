# n:1~ について0~9が全て出るカウントを取得 => そもそもsqrtでそんな長いこと出ない && 一生0~9のどれかが出現しなかったら？
# とりあえず最初10桁で全て出現する場合？
# 探索対象の桁数を増やしていく？

def take_chars_of_sqrt(n, count, int_included:)
  i, d = Math.sqrt(n).to_s.split('.')

  if int_included
    chars = i.chars
    (chars + d.chars.take(count - chars.length))
  else
    d.chars.take(count)
  end
end

def solve(int_included:)
  10_000.times do |n|
    return n if take_chars_of_sqrt(n, 10, int_included:).uniq.count == 10
  end
end

p solve(int_included: false)
p solve(int_included: true)
