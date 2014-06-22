// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery.ui.datepicker
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$('#job_seeker_country_id').on('change', function(event) {
		$.ajax({
		  url: "/get_states?country_id="+$(this).val(),
		  dataType: "json",
		  success: function(data) {
		  	console.log(data)
		    var options, index, select, option;		    
		    select = document.getElementById('job_seeker_state_id');
		    select.options.length = 0;
		    select.options.add(new Option('Select State',''));		    
		    options = data;
		    for (index = 0; index < options.length; ++index) {
		      option = options[index];
		      select.options.add(new Option(option[0], option[1]));
		    }
		  }
		});
	});
});
