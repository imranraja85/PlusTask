var in_progress_div = $('#tasks-in-progress');
var a = $('#frack');
var html = a.parent().parent().html();

a.parent().parent().remove();
in_progress_div.append(html);
