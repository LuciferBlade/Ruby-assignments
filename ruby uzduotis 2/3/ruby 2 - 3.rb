#pradine skaiciu aibe
base_array = [1,2,3,4,5,6,7,8,9]
#kintanciu zenklu aibe
signs = Array.new(base_array.size-1) {|i| 0}

puts "This application shows a solution of how you could put signs + and * to get wanted value."
puts "The numbers are put in this order: #{base_array}"
puts "Now there's only the need to put signs in correct order."
puts ""


#nuskaitoma reiksme
puts "Please enter the value that you would like to get:"
number = 0
input = gets.strip
if !input.match(/^[-]?\d+?$/)
	puts "You entered invalid value!"
	exit
end
#reiksme paverciama i skaiciu nes atitiko RegEx schema
number = input.to_i

while signs[signs.size-1] != 3

	#suskaiciuojami visi zenklai
	temp = 0
	signs.size.times do |i|
		if signs[i] != 0 
			temp = temp +1
		end
	end

	#sudaromi laikinu skaiciu ir zenklu masyvai
	temp1 = Array.new(temp+1) {|i| 0}
	temp2 = Array.new(temp) {|i| 0}

	j = 0
	t = base_array.size-1
  t.times do |i|
  	if signs[i] == 0
  		temp1[j] = temp1[j]*10+base_array[i]
  	else
  		temp1[j] = temp1[j]*10+base_array[i]
  		temp2[j]=signs[i]
  		j = j+1
  	end
  	if i == base_array.size-2
      temp1[j]=temp1[j]*10+base_array[base_array.size-1]
    end
  end

  #issaugomas zenklu kiekis
  sign_amount = j

  #vykdoma daugyba
  i=0
  while i <= sign_amount
  	if temp2[i] == 2
  		temp1[i] = temp1[i]*temp1[i+1]
  		for k in i+1..sign_amount+1
  			temp1[k] = temp1[k+1]
  		end
  		for k in i..sign_amount
  			temp2[k]=temp2[k+1]
  		end
  		j = j-1
  		i = i-1
  	end
  	i = i+1
  end

  sign_amount = j

  #vykdoma sudetis
  i=0
  while i <= sign_amount
  	if temp2[i] == 1
  		temp1[i] = temp1[i]+temp1[i+1]
  		for k in i+1..sign_amount+1
  			temp1[k] = temp1[k+1]
  		end
  		for k in i..sign_amount
  			temp2[k]=temp2[k+1]
  		end
  		j = j-1
  		i = i-1
  	end
  	i = i+1
  end              

  #Jeigu rasta seka po daugybos ir sudeties atspauzdinamas galimas sprendimas
  if temp1[0] == number
  	signs.size.times do |i|
  		print base_array[i]
  		if signs[i] == 1
  			print "+"
  		end
  		if signs[i] == 2
  			print "*"
  		end
  	end
  	print base_array[base_array.size-1]
  	puts "=#{number}"
  	break
  end

	#zenklu keitimas
	signs[0] = signs[0] +1
	signs.size.times do |i|
		if signs[i] == 3
			if i+1 > signs.size-1
				#break'as jeigu jau visi zenklai ir ju pozicijos pereitos
				puts "Solution with sum and multiplication opperations haven't been found! :("
				break
			else
				signs[i+1] = signs[i+1] +1
				signs[i] = 0
			end
		end
	end
end