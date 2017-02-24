<form action="/add_task" method="POST">
<input type="text" name="task"/><br>
<input type="submit" value="add task"/>
</form>
<ul>
<% tasks.each do |task| %>
	<li> 
		<% if task.complete == true %>
			<h1><%= task.taskvalue %></h1>
		<% else %>
			<%= task.taskvalue %>
		<% end %>	 
		<form action="/remove_task" method="POST">		
		<input type="hidden" name="task" value="<%=task.taskid%>"/>
		<button type="submit">X</button></form>
		<form action="/edit_task" method="POST">
		<input type="hidden" name="taskidn" value="<%=task.taskid%>"/>
		<input type="text" name="task" />
		<input type="submit" value="edit task">
		</form>
	</li>
<% end %>
</ul>
<style>	
.done{font-color:red}
</style>