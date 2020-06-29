include Math

class Shape
def initialize()
  @name = "Shape"
  @area = "0"
  @perimeter = "0"
end

def print()
puts "The shape is: "+@name+", it's area is: "+@area.to_s+",and it's perimeter is: "+@perimeter.to_s+"."
end 

def perimeter()
return nil
end 

def area()
return nil
end 
end 

class Circle < Shape
def initialize(radius)
super()
@radius = radius
@name = "Circle"
end

def perimeter
if @radius <= 0
puts "This is a circle that does not exist"
exit(1)
else 
@perimeter = @radius2Math::PI
return @perimeter
end
end

def area
if @radius <= 0
puts "This is a circle that does not exist"
exit(1)
else
@area = @radius2Math::PI
return @area
end 
end
end

class Rectangle < Shape
def initialize(width, height)
super()
@name = "Rectangle"
@width = width
@height = height
end 

def perimeter
if @width <= 0 || @height <= 0
puts "This is a rectangle which does not exist"
exit(1)

else 
@perimeter = 2*@height + 2*@width
return @perimeter
end 
end 

def area
if @width <= 0 || @height <= 0
puts "This is a rectangle which does not exist"
exit(1)
else
@area = @width*@height
return @area
end
end
end

class Ellipse < Shape
def initialize(a,b)
super()
@name ="Ellipse"
@a = a
@b = b
end

def perimeter
return @perimeter
end

def area
if @a <= 0 || @b <= 0
puts "This cannot be an ellipse"
exit(1)
else
@area = @a*@b*Math::PI
return @area
end
end

def name
    return @name
end

def eccentricity
if @a <= 0 || @b <= 0
puts "This cannot be an ellipse"
exit(1)
else
@eccentricity = Math.sqrt(@a**2 - @b**2)
return @eccentricity
end



end
end

x= Shape.new()
x.print

y = Circle.new(1)
y.area
y.perimeter
y.print

z = Rectangle.new(1,3)
z.area
z.perimeter
z.print

a = Ellipse.new(2,1)
puts "The shape is: "+a.name+", it's area is:"+a.area.to_s+", and it's eccentricity is: "+a.eccentricity.to_s+"." 

