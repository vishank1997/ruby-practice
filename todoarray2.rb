require 'sinatra'

class Task
	attr_accessor :taskvalue,:taskid, :complete
def initialize(task,id)
	@taskvalue=task
	@taskid=id
	@complete = true
end	
	
def toggle
	@complete = !@complete
end
end
tasks = []
unique_id = 1
get '/' do 
	erb :tasks ,locals: {:tasks => tasks}
end

post '/add_task' do
	unique_id = unique_id + 1
	task = Task.new(params[:task],unique_id)
	tasks<<task
	redirect '/'	
end

post '/remove_task' do 
	task2 = nil
	tasks.each do|task1|
		if task1.taskid == params[:task].to_i
			task2 = task1
			break
		end	
	end	
	task2.toggle
	redirect '/'
end


post '/edit_task' do
	task4 = nil
	tasks.each do|task3|
		if task3.taskid == params[:taskidn].to_i
			task4 = task3
			break
		end
	end
	task4.taskvalue = params[:task]
	redirect '/'
end	

