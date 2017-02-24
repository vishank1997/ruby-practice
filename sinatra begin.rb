require 'sinatra'
set :bind, '0.0.0.0'
get '/' do
	erb :mytemp2	
end

get '/time' do
	"time is #{Time.now}"
end

get '/temp' do 
	erb :mytemp
end

get '/user/:name' do
	erb :user
end