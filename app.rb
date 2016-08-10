require 'bundler'
Bundler.require()

get '/' do
	xml_feed_to_json('http://api.petfinder.com/shelter.getPets?id=IL542&count=1000&key=4f968c74b90183bfb8519a8cf64844f2&callback=?')
end

def xml_feed_to_json(url)
	@xml = HTTParty.get(url)
	# convert all breed Strings to Arrays
	if @xml["petfinder"]["pets"]["pet"]["breeds"]["breed"].class == String
		arr = Array.new
		arr.push(@xml["petfinder"]["pets"]["pet"]["breeds"]["breed"])
		@xml["petfinder"]["pets"]["pet"]["breeds"]["breed"] = arr
	end
	@xml.to_json
end
