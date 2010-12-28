/*
This method can be used to add a select all checkboxes checkbox (and have multiple 'select all on the page)
  
USAGE: new SelectAllButton(selector_of_the_select_all_input_checkbox, selector_for_the_section_where_the_check_boxes_to_be_selected_are);
EXAMPLE:
jQuery(document).ready(function(){
  new SelectAllButton('#select_all', '#eft-transaction-section');
  new SelectAllButton('#select_all2', '#eft-transaction-section2'); // selector names must be unique on the page
});
  
using the window[] javascript function to create variables unique to the selector. If one uses 
  
TODO - abstract this so you can call it once on the page and it will create the select alls for all sections marked by a class 'select-all-section' and a select within that section with a class 'select-all'
*/
var SelectAllButton = function(selector,within_selector){
  var $ = jQuery;
  window['select_all_checkbox'+selector] = $(selector);
  window['checkboxes' + selector] = $('input:checkbox', within_selector)
     
  var self = {
    init: function(){
         self.update_checkboxes();
     self.init_events();
    },  
        init_events: function(){
      window['select_all_checkbox'+selector].click(self.update_checkboxes);
    },
    update_checkboxes: function(){
            window['select_all'+selector] = window['select_all_checkbox'+selector].is(':checked');
            window['select_all'+selector] ? window['checkboxes' + selector].each(function(){this.checked = 'checked'}) : window['checkboxes' + selector].each(function(){this.checked = false});                        
    }
  };
  self.init();
  return self;
}

