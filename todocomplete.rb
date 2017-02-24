require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/data.db")

class User
	include DataMapper::Resource
	property :id, Serial
	property :email, String
	property :password, String
end
class Task
	include DataMapper::Resource
	property :id, Serial
	property :task, String
	property :complete, Boolean
	property :user_id, Integer	
end	
DataMapper.finalize
DataMapper.auto_upgrade!
User.auto_upgrade!
Task.auto_upgrade!
tasks = []
get '/' do
	user = nil
	if session[:user_id]
		user = User.get(session[:user_id])
	#else 
	#	redirect '/signin'
	end	
	erb :index, locals: {user: user}
end

get '/signup' do
	erb :signup 
end

post '/register' do
	email = params[:email]
	password = params[:password]
	user = User.all(:email => email).first
	if user
		redirect '/signup'
	else
		user = User.new
		user.email = email
		user.password = password
		user.save
		session[:user_id] = user.id
		redirect '/'
	end		

end

get '/logout' do
	session[:user_id]= nil
	redirect '/signin'
end

get '/signin' do
	erb :signin
end

post '/signin' do
	email = params[:email]
	password = params[:password]
	user = User.all(:email => email).first

	if user
		if user.password == password
			session[:user_id] = user.id
		else
			redirect	'/signin'
		end	
	redirect'/'
	end
	redirect '/signup'
end
















post '/add_task' do
	task = Task.new()
	task.task = params[:task]
	task.complete = false
	task.save
	redirect '/'	
end

post '/remove_task' do 
	task_id = params[:task]
	task2 = Task.get(task_id)
	task2.complete = !task2.complete
	task2.save
	redirect '/'
end


#post '/edit_task' do
#	task4 = nil
#	tasks.each do|task3|
#		if task3.taskid == params[:taskidn].to_i
#			task4 = task3
#			break
#		end
#	end
#	task4.taskvalue = params[:task]
#	redirect '/'
#end