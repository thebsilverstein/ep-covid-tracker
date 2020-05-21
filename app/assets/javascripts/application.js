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

  $('#chart_total_cases_by_day_logarithmic').hide();

  $('input[name=total_cases_by_day_options]').click(function() {
    $('#chart_total_cases_by_day').hide();
    $('#chart_total_cases_by_day_logarithmic').hide();
    if ($(this).val() == "total_cases_by_day") {
      $('#chart_total_cases_by_day').show();
      $("#total_cases_by_day").highcharts().reflow();
    }
    if ($(this).val() == "total_cases_by_day_logarithmic") {
      $('#chart_total_cases_by_day_logarithmic').show();
      $("#total_cases_by_day_logarithmic").highcharts().reflow();
    }
  });

  $('#chart_total_deaths_by_day_logarithmic').hide();

  $('input[name=total_deaths_by_day_options]').click(function() {
    $('#chart_total_deaths_by_day').hide();
    $('#chart_total_deaths_by_day_logarithmic').hide();
    if ($(this).val() == "total_deaths_by_day") {
      $('#chart_total_deaths_by_day').show();
      $("#total_deaths_by_day").highcharts().reflow();
    }
    if ($(this).val() == "total_deaths_by_day_logarithmic") {
      $('#chart_total_deaths_by_day_logarithmic').show();
      $("#total_deaths_by_day_logarithmic").highcharts().reflow();
    }
  });
});