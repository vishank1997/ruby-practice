require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/data.db")

class Task
	include DataMapper::Resource
	property :id, Serial
	property :task, String
	property :complete, Boolean
	
end	
DataMapper.finalize
Task.auto_upgrade!
DataMapper.auto_upgrade!	
tasks = []
get '/' do
	tasks = Task.all() 
	erb :tasks ,locals: {:tasks => tasks}
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

