$('.remove-parent-div').live('click', function(event)
  {
    var containing_div = $("#new_task");
    containing_div.remove();
  });


$('.remove-parent-div').live('click', function(event)
  {
    //var containing_div = $(this.parent("div"));
    var containing_div = $("#show-task");
    containing_div.remove();
  });
