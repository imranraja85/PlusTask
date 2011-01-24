var task_started = $("#<%= @task.id %>"); //find the id of the task selected
task_started.text("Complete Task");       //Update the link text
var html = task_started.parent().parent().html(); //find the container for the task and extract html

var in_progress_div = $('.tasks-in-progress-list');
task_started.parent().parent().remove();  //remove that task

in_progress_div.prepend("<li>" + html + "</li>"); //add the task to the 'tasks in progress' list
