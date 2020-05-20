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
    time: 600
  });

  $("#totalCasesByZipCode").dataTable({
    "paging":   false,
    "info":     false,
    "searching":   false,
  });

  $('#total_cases_by_day_logarithmic').hide();

  $('input[type=radio]').click(function() {
    $('#total_cases_by_day').hide();
    $('#total_cases_by_day_logarithmic').hide();
    if ($(this).val() == "total_cases_by_day") {
      $('#total_cases_by_day').show();
    }
    if ($(this).val() == "total_cases_by_day_logarithmic") {
      $('#total_cases_by_day_logarithmic').show();
    }
  });
});