# ごちゃってる

# @return [int, arr] 階層と、実際に使ったcountries
def find_next(country, countries, depth)
  next_countries = countries

  unless country.nil?
    last = country.chars.last
    next_countries = countries.select { |s| s.chars.first == last }
  end

  return [depth, [country]] if next_countries.empty?

  max_depth = 0
  used = []
  next_countries.each do |next_country|
    dup = countries.dup
    dup.delete(next_country)

    next_depth, next_used = find_next(next_country, dup, depth + 1)
    if max_depth < next_depth
      max_depth = next_depth
      used = next_used
    end
  end
  [max_depth, [country] + used]
rescue StandardError
  binding.irb
end

def solve
  countries = ['Brazil', 'Croatia', 'Mexico', 'Cameroon',
               'Spain', 'Netherlands', 'Chile', 'Australia',
               'Colombia', 'Greece', "Cote d'Ivoire", 'Japan',
               'Uruguay', 'Costa Rica', 'England', 'Italy',
               'Switzerland', 'Ecuador', 'France', 'Honduras',
               'Argentina', 'Bosnia and Herzegovina', 'Iran',
               'Nigeria', 'Germany', 'Portugal', 'Ghana',
               'USA', 'Belgium', 'Algeria', 'Russia',
               'Korea Republic'].map(&:upcase)

  find_next(nil, countries, 0)
end

p solve
