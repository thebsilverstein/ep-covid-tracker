//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require highcharts/highcharts
//= require jquery.waypoints.min
//= require jquery.countup.min
//= require datatables

$( document ).ready(function() {
  $('.counter').countUp({
    delay: 10,
    time: 1000
  });

  $("#totalCasesByZipCode").dataTable({
    "paging":   false,
    "info":     false,
    "searching":   false,
  });
});