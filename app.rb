require 'bundler'
Budler.require()

get '/' do 

	 {:test => “msg”}.to_json
end