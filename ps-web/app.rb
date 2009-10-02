require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

gem 'chriseppstein-compass', '~> 0.4'
require 'compass'

configure do
  set :views, Proc.new { File.join(File.dirname(__FILE__), 'haml') }
end

get '/:f.html' do
  haml params[:f].intern
end

get '/images/:f' do
  send_file File.join(File.dirname(__FILE__), 'images', params[:f])
end

get '/stylesheets/:f.css' do
  content_type 'text/css', :charset => 'utf-8'
  f = params[:f]
  sass f.intern, { :sass => { :load_paths => (
    [ File.join(File.dirname(__FILE__), 'sass') ] + Compass::Frameworks::ALL.map {|x| x.stylesheets_directory })
  } }
end
