require 'bundler'
Budler.require()

get '/' do 

	file = File.read('book.json')
	hash = JSON.parse(file)
	hash.to_json
end