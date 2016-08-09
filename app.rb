require 'bundler'
Bundler.require()

get '/' do
#	file = File.read('book.json')
#	hash = JSON.parse(file)
#	hash.to_json
	xml_feed_to_json('http://api.petfinder.com/shelter.getPets?id=IL542&count=1000&key=4f968c74b90183bfb8519a8cf64844f2&callback=?')
end

def xml_feed_to_json(url)
	@xml = HTTParty.get(url)
	Crack::XML.parse(@xml).to_json
end