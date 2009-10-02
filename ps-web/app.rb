require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

gem 'chriseppstein-compass', '~> 0.4'
require 'compass'

configure do
  set :views, File.dirname(__FILE__)

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
  end
end

get '/:f.html' do
  ff = File.join('haml', params[:f])
  haml ff.intern
end

get '/images/:f' do
  send_file File.join(File.dirname(__FILE__), 'images', params[:f])
end

get '/stylesheets/:f.css' do
  content_type 'text/css', :charset => 'utf-8'
  ff = File.join('sass', params[:f])
  sass ff.intern, :sass => Compass.sass_engine_options
end
