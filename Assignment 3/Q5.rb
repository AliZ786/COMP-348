#function to convert string to numbers. If string can not be converted to corresponding integer, it returns null 
def s_to_i(string)
    n=string.to_i
	n if n.to_s==string
end

#Fin is a file object
shapesidecount={"Rectangle"=>2,"Circle"=>1,"Ellipse"=>2}
fin=File.open("Shape.txt",'r') 
lines=fin.readlines;
  lines.each do |str| 
     str=str.strip;#removing unnecessary spaces from beginning and end of each line
     words=str.split;
	 valid=true #valid is a flag to ensure if parameters for a certain shape are appropriate
	 1.upto(words.size-1) do |i|
	     words[i]=s_to_i(words[i])
		 if (words[i]==nil)
		     valid=false
		 elsif words[i]<0
		     valid=false
		 end
	 end
	 if (valid==true)&&(words[0].downcase!="rectangle")&&(words[0].downcase!="circle")&&(words[0].downcase!="ellipse")
		 perimeter="undefined"
		 area="undefined"
    elsif (valid==true)&&(words[0].downcase=="rectangle")
	     if (words.size-1)!=shapesidecount["Rectangle"]
		     valid=false
		 elsif (words[1]==0)||(words[2]==0)
		     perimeter=0
			 area=0
		 else
		     perimeter=2*(words[1]+words[2])
			 area=words[1]*words[2]
		end
    elsif (valid==true)&&(words[0].downcase=="circle")
	     if (words.size-1)!=shapesidecount["Circle"]
		     valid=false
		 else
		     perimeter=2*Math::PI*words[1]
			 area= Math::PI*words[1]*words[1]
		end
	elsif (valid==true)&&(words[0].downcase=="ellipse")
	     if (words.size-1)!=shapesidecount["Rectangle"]
		     valid=false
		 else
		     perimeter="undefined"
			 area=Math::PI*words[1]*words[2]			 
		end
	 end
	 if valid
	 puts "#{words[0]},\tPerimeter:#{perimeter},\t Area:#{area}"
	 else
	 puts "ERROR : Invalid #{words[0]}"
	 end
	end
fin.close();

size = 7
a = Array.new(size, '*').fill('=', 1..-2).join(' ') #=> "* = = = = = *"
b = Array.new(size, '*').join(' ')                  #=> "* * * * * * *"


pattern = [a, a, b].cycle


puts pattern.take(size)

	

i=1
k=5
t=5

i.upto(k) do
  t.times do
    print ' '
  end

  (2 * i - 1).times do
    print '*'
  end

  print "\n"


  t -= 1
  i += 1
end

