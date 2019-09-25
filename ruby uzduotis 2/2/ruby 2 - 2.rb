input_file = File.new("/home/blade/ruby stuf/ruby uzduotis 2/2/figuros.txt", "r")

output = File.new("/home/blade/ruby stuf/ruby uzduotis 2/2/output.html", "w")

figure_names = ["Polyline", "Polygon", "Line", "Ellipse", "Circle", "Rectangle", "Other"]
figure_array = [0,0,0,0,0,0,0]


input_file.each do |line|
	parts = line.split(",")
	parts.each do |word|
		parts2 = word.split(" ")
		parts2.each do |word2|
			if word2 == figure_names[0]
				figure_array[0] = figure_array[0] +1
			elsif word2 == figure_names[1]
				figure_array[1] = figure_array[1] +1
			elsif word2 == figure_names[2]
				figure_array[2] = figure_array[2] +1
			elsif word2 == figure_names[3]
				figure_array[3] = figure_array[3] +1
			elsif word2 == figure_names[4]
				figure_array[4] = figure_array[4] +1
			elsif word2 == figure_names[5]
				figure_array[5] = figure_array[5] +1
			else
				figure_array[6] = figure_array[6] +1
			end
		end
	end
end

input_file.rewind

output.puts "<!DOCTYPE html>"
output.puts "<html>"
output.puts "<body>"

output.puts "<style>"
output.puts "table, th, td {"
output.puts "border: 1px solid black;"
output.puts "border-collapse: collapse;"
output.puts "} </style>"
output.puts ""

output.puts "If a shape in file contained multiple shapes (ex. Line Line Line) these are counted as separate shapes (ex. 3 Lines). However they aren't drawn separately."
output.puts ""

output.puts "<table style=\"width:100%\">"

output.puts "<tr>"
figure_names.each do |i|
	output.puts "<th>#{i}</th>"
end
output.puts "</tr>"

output.puts "<tr>"
figure_array.each do |i|
	output.puts "<th>#{i}</th>"
end
output.puts "</tr>"

output.puts "</table>"
output.puts ""

input_file.each do |line|
	parts = line.split(",")
	parts.each do |word|
		if word.start_with? " "
			word[0] = ""
		end
		output.print "#{word}:"
		output.puts "<svg width=\"100\" height=\"100\">"

		parts2 = word.split(" ")
		print parts2
		parts2.each do |word2|
			if word2 == figure_names[0]
				output.print "<polyline points=\""
				temp = rand(10)+3
				temp.times{
					output.print "#{rand(100)},#{rand(100)} "
				}
        output.puts "\""
        output.print "style=\"fill:none;"
       	output.puts "stroke:rgb(#{rand(256)},#{rand(256)},#{rand(256)});stroke-width:#{rand(10)+1}\" />"
      elsif word2 == figure_names[1]
        output.print "<polygon points=\""
        temp =rand(5)+3
        temp.times {
        	output.print "#{rand(100)},#{rand(100)} "
        }
        output.puts "\""
        output.print "style=\"fill:rgb(#{rand(156)},#{rand(256)},#{rand(256)});"
        output.print "stroke:rgb(#{rand(256)},#{rand(256)},#{rand(256)});"
        output.puts "stroke-width:#{rand(10)+1}\" />"
      elsif word2 == figure_names[2]
        output.print "<line x1=\"#{rand(100)}\" y1=\"#{rand(100)}\" x2=\"#{rand(100)}\" y2=\"#{rand(100)}\" "
        output.print "style=\"stroke:rgb(#{rand(256)},#{rand(256)},#{rand(256)});"
        output.puts "stroke-width:#{rand(10)+1}\" />"
      elsif word2 == figure_names[3]
      	output.print "<ellipse cx=\"#{rand(100)}\" cy=\"#{rand(100)}\" rx=\"#{rand(100)}\" ry=\"#{rand(100)}\" "
        output.print "style=\"fill:rgb(#{rand(256)},#{rand(256)},#{rand(256)});"
        output.print "stroke:rgb(#{rand(256)},#{rand(256)},#{rand(256)});"
        output.puts "stroke-width:#{rand(10)+1}\" />"
      elsif word2 == figure_names[4]
      	output.print "<circle cx=\"#{rand(100)}\" cy=\"#{rand(100)}\" r=\"#{rand(100)}\" "
        output.print "stroke=rgb(#{rand(256)},#{rand(256)},#{rand(256)}) "
        output.print "stroke-width=#{rand(10)+1}\" "
        output.puts "fill=rgb(#{rand(256)},#{rand(256)},#{rand(256)}) />"
      elsif word2 == figure_names[5]
      	output.print "<rect width=\"#{rand(99)+1}\" height=\"#{rand(99)+1}\" "
        output.print "style=\"fill:rgb(#{rand(256)},#{rand(256)},#{rand(256)});"
        output.print "stroke-width:#{rand(10)+1}\";"
        output.puts "stroke:rgb(#{rand(256)},#{rand(256)},#{rand(256)})\" />"
      else
      	puts "dayum"   	        
      end
		end
		output.puts "</svg>"
	end
end

output.close
input_file.close