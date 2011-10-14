jQuery(document).ready(function(){
  /* This handles changing the class of the menu items in the project show page.
   * We remove the active class from all previous links. Then we add the active
   * class to the current link clicked 
   */
  $(".quick-links li a").click(function(event)
  {
     var current_link = $(this); // jQuery wrapper for clicked element
     var previous_link = $('.active');

     previous_link.removeClass("active");
     current_link.parent().addClass("active");
     history.pushState(null, "", this.href);
  });

  $(window).bind("popstate", function(){
     var current_link = $(this); // jQuery wrapper for clicked element
     var previous_link = $('.active');

     previous_link.removeClass("active");
     current_link.parent().addClass("active");

    $.getScript(location.href);

  });
});
