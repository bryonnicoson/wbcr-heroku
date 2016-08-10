require 'bundler'
Bundler.require()

get '/' do
	xml_feed_to_json('http://api.petfinder.com/shelter.getPets?id=IL542&count=1000&key=4f968c74b90183bfb8519a8cf64844f2&callback=?')
end

def xml_feed_to_json(url)
	@xml = HTTParty.get(url)
	# convert all breed Strings to Arrays
	# need to step through each pet in "[petfinder][pets]"
	@xml["petfinder"]["pets"].each do |pet|
		#binding.pry
		breed = pet[1][0]["breeds"]["breed"]
		if breed.class == String
			arr = Array.new
			arr.push(breed)
			#pet["breeds"]["breed"] = arr
			pet[1][0]["breeds"]["breed"] = arr
		end
	end

	
	@xml.to_json
end
