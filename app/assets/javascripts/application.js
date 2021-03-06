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
//= require turbolinks
//= require jquery.ui.all
//= require jquery-ui-timepicker-addon
//= require_tree .
$(document).on('ready page:load', function () {
  $(function() {
    $("#game_start_time").datetimepicker({
      showButtonPanel: true,
      dateFormat: 'dd/mm/yy',
      showOn: "button",
      buttonImage: "/calendar.gif",
      buttonImageOnly: true
      //buttonText: "cal"
    });

    //$("#start_time_dt").timepicker();
    $("#game_end_time").datetimepicker({
      showButtonPanel: true,
      dateFormat: 'dd/mm/yy',
      showOn: "button",
      buttonImage: "/calendar.gif",
      buttonImageOnly: true
    });
  });
  $(function() {
    $("#term_and_condition").on("click", function(){
      alert(" Term and Condition\n1. Always Follow Rules for login\n ");
    })
  });
  
});
  

function update_teams_div2(school_id) {  
  $.ajax({
    url: "/update_teams2",
    type: "GET",
    data: {"school_id" : school_id},
    dataType: "html",
    success: function(data) {
      $("#teamsDiv2").html(data);
    }  
  });
}
  
function update_teams_div(school_id) {  
  $.ajax({
    url: "/update_teams",
    type: "GET",
    data: {"school_id" : school_id},
    dataType: "html",
    success: function(data) {
      $("#teamsDiv").html(data);
    }  
  });
}

function update_teams_devise(school_id) {  
  $.ajax({
    url: "/update_team",
    type: "GET",
    data: {"school_id" : school_id},
    dataType: "html",
    success: function(data) {
      $("#teamsDevise").html(data);
    }  
  });
}

