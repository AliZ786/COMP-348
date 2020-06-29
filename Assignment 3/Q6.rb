def displayShapes(shapes)
    shapes_sum = 0
    rectangles_sum = 0 
    circles_sum = 0 
    ellipses_sum = 0 
    
    shapes.each_pair do |key, value|
        case value.class
        when "Shape"
            shapes_sum = shapes_sum + 1;
            
        when "Rectangle"
            rectangles_sum = rectangles_sum + 1;
            
        when "Circle"
            circles_sum = circles_sum + 1;
            
        when "Ellipses"
            ellipses_sum = ellipses_sum + 1;
        end
    end
    puts "Statistics: "
    puts "    Shape(s): #{shapes_sum+rectangle_sum+circles_sum+ellipses_sum}"
    puts "    Rectangle(s): #{rectangles_sum}"
    puts "    Circle(s): #{circles_sum}"
    puts "    Ellipse(s): #{ellipses_sum}"
end
