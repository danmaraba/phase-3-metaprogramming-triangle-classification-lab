class Triangle
  # write code here
  attr_reader :length_x, :length_y,:length_z
  def initialize (length_x,length_y,length_z)
    @length_x = length_x
    @length_y = length_y
    @length_z = length_z
  end

  def kind
    validate
    if length_x == length_y && length_y ==length_z
      :equilateral
    elsif length_x == length_y || length_y  == length_z || length_z == length_x 
      :isosceles
    else  
      :scalene
    end
  end

  def validate
    true_triangle = [(length_x + length_y > length_z), (length_x + length_z > length_y),(length_y + length_z > length_x)]
    [length_x,length_y,length_z].each do |side|
      true_triangle << false if side <= 0
      raise TriangleError if true_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
    def message
      "Triangle inequality failed"
    end
  end


end
