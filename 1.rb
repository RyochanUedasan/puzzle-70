def kaibun?(str)
  str == str.reverse
end

ans = 10

while true
  break if kaibun?(ans.to_s(10)) && kaibun?(ans.to_s(8)) && kaibun?(ans.to_s(2))

  ans += 1
end

p [ans, ans.to_s(8), ans.to_s(2)]
