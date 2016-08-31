require 'bundler'
Bundler.require()

get '/' do	
	xml_feed_to_json(ENV['PETFINDER_API_URL'])
end

def xml_feed_to_json(url)
	@xml = HTTParty.get(url)
	
	# convert all breed Strings to Arrays
	@xml["petfinder"]["pets"].each do |pet|
		#binding.pry
		i = 0
		length = pet[1].size

		while i < length
			breed = pet[1][i]["breeds"]["breed"]
			if breed.class == String
				arr = Array.new
				arr.push(breed)
				pet[1][i]["breeds"]["breed"] = arr
			end
			i += 1
		end
	end
	
	@xml.to_json
end
