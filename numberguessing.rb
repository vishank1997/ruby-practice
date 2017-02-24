#ruby
puts "welcome to whats my number?"
puts "what is your name?"
ch=gets.to_s.chomp
print "hello"+ ch + "how are you"
number = rand(10..20)
print number
print "ok i have selected my number guess what it is"
select=gets.to_i
guess=1
until select==number
	if select<number
	print "your number is smaller\n try once more"
	select=gets.to_i
	guess=guess+1
	
	elsif select>number
	print "your no. is larger\n try once more"
	select=gets.to_i
	guess=guess+1
	end
end
puts "no. of guess ="+guess.to_s
