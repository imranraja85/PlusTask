//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .
//= require_directory ./app
//= require_directory ./plugins
//= require_directory ./ui

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    var flash = $('#flash_notice');
    flash.delay(1500).slideUp(3000);          
 });
