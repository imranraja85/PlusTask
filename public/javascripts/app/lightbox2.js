/* Lightbox2.js
   = Description
   The following code produces a simple object to encapsulate lightbox javascript logic.

   = Change log
   [2010-07-14 -- RT] Initial Creation

   = Dependencies
   Depends on the:  jquery.simplemodal-1.3 for lightbox creation.
                    ba-bbq.jquery for deserializing query strings.

   = Usage
   Add the "lightbox2" class to any link to encapsulate it in a lightbox.
   If you don't want to use an iframe, add the class "noiframe" also.
   
   Addtional options are availble as a query string at the end of the url:
   -  minWidth
   -  minHeight
   -  opacity

 */
var Lightbox2 = function(){

  var $ = jQuery,
      lightbox = $(".lightbox"),
      closeLightbox = $(".close-lightbox"),
      defaultOptions = {
        minWidth: 660,
        minHeight: 400,
        opacity: 0.8
      };

  var self = {

    init: function(){
      lightbox.live("click", self.open);
      closeLightbox.live("click", self.close);
    },

    // Gather options and Open Lightbox
    // If `this` is an info image found on store selector
    // page, build the url from the store short name,
    // otherwise, use the href found on the link
    
    open: function(){
      
      var selectedLink = $(this).attr("href"),
          options = $.deparam.querystring(selectedLink, true),
          finalOptions = $.extend({}, defaultOptions, options),
          modalbox;

      // Open lightbox
      // Use iframes by default, unless the class noiframe is found
      if ($(this).hasClass(".noiframe")){
        modalbox = $.modal("", finalOptions);
        modalbox.setPosition();

        if ($("#simplemodal-data")){
          $.get(selectedLink, function(response){
            $("#simplemodal-data").html(response);
          }, "html");
        }
      } else {
        modalbox = $.modal(self.iframe(selectedLink,finalOptions), finalOptions);
      }

      return false;
    },

    close: function(){
      window.parent.location = window.parent.location;
      return false;
    },

    iframe: function(link,options){
      return "<iframe id='inner-iframe' " +
        "src='" + link + "'" +
        "width='" + options.minWidth + "'" +
        "height='"+ options.minHeight + "'" +
        "></iframe>";
    }
  };

  return self.init();
};

// Initialize on document ready 
jQuery(document).ready( function(){
  var lightbox2 = new Lightbox2();
});


