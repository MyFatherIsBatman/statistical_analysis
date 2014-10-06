csv = File.open("total-population.csv","r")
data = csv.readlines
logLength = data.length

year = []
population = []
i = 0

while i < data.length
	data[i] = data[i].split(",")
	year << data[i][0].to_s
	population << data[i][1].to_f
	i+=1
end
total_population = 0 
	population.each do |x|
	total_population += x
end
mean = total_population / logLength
total_variance = 0
	population.each do |p|
	total_variance += (mean - p)**2
end

length_minus1 = logLength - 1
variance = total_variance / length_minus1
standard_deviation = Math.sqrt(variance)
outputs = File.open("output.txt", "w")

population.each do |x|
	z = (x - mean) / standard_deviation
	outputs.write(z)
	outputs.write("\n")
end


puts year
puts "======================================================="
puts population
	mean = total_population / logLength
puts "Average population is: " + mean.to_s
puts "Standard Deviation is: " + standard_deviation.to_s

puts "Would you like to see the zscores?"
read_zscore = File.open("outputs.txt", "r")
data_zscores = read_zscore.readlines
answer = gets.chomp
if answer == "yes"
	puts "Here are the zscores: "
	puts data_zscores
elsif answer == "no"
	read_zscores.close
	puts "Wow, okay then."
end
sorted = population.sort
median = logLength % 2 == 1 ? sorted[logLength/2] : (sorted[logLength/2 - 1] + sorted[logLength/2]).to_f / 2
puts "The median is: " 
puts median

