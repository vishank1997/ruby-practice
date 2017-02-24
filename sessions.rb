require 'sinatra'

set :sessions, true

get '/' do
if session[:counter]
	session[:counter] += 1
else
	session[:counter] = 1
end
	erb	:session, locals: {counter: session[:counter]}	
end