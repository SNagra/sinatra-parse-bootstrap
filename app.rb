require 'bundler/setup'
require 'sinatra'
require 'thin'
require 'parse_resource'
require 'json'
require 'haml'
require 'sass'
require 'compass'
require 'bootstrap-sass'

configure do
	ParseResource::Base.load!("Na5kjt6hnLdcVmA8Q5HO7yHkqJtI2fbCyWZukHay", "8awTOQlMlwqAz6eO7KsjrcKK1v6HQWKX84yTuOaf")
	
	Compass.configuration do |config|
		config.project_path = File.dirname(__FILE__)
		config.sass_dir = 'views'
	end

	set :app_file, __FILE__
	set :root, File.dirname(__FILE__)
	set :views, 'views'
	set :public_folder, 'public'
	set :haml, { :format => :html5 }
	set :sass, Compass.sass_engine_options
end

get '/' do
	haml :home, :layout => :'layouts/application'
end

get '/views/stylesheets/styles.css' do
  sass :styles
end