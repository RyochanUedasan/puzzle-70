# 同じ比で整数倍ってどういうことなん

class Rectangle
  @width, @height = nil

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end

  def aspect_ratio
    @width / @height.to_f
  end
end

class Rectangles
  @rectangles = []

  def initialize(rectangles)
    @rectangles = rectangles
  end

  def ratios
    @rectangles.map(&:aspect_ratio).sort
  end
end

# @return Array[Rectangles]
def matched_rectangles(rope_length)
  return [] if rope_length % 4 != 0

  area = (rope_length / 4)**2 # 正方形は一意に決まるので、面積も

  (1..rope_length / 4).filter_map do |width1|
    (1..rope_length / 4).filter_map do |width2|
      rec1 = Rectangle.new(width1, rope_length / 2 - width1)
      rec2 = Rectangle.new(width2, rope_length / 2 - width2)

      Rectangles.new([rec1, rec2]) if rec1.area + rec2.area == area
    end
  end.flatten
end

def solve
  (1..500).flat_map { matched_rectangles(_1) }.map(&:ratios).uniq.count
end

p solve
# p solve
