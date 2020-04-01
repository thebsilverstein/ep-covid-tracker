class DashboardController < ApplicationController
  def index

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      # f.global(useUTC: false)
      f.chart(
        # backgroundColor: {
        #   linearGradient: [0, 0, 500, 500],
        #   stops: [
        #     [0, "rgb(255, 255, 255)"],
        #     [1, "rgb(240, 240, 255)"]
        #   ]
        # },
        # borderWidth: 2,
        # plotBackgroundColor: "rgba(255, 255, 255, .9)",
        # plotShadow: true,
        # plotBorderWidth: 1
        style: { fontFamily: '\'Inter\', sans-serif'}
      )
      f.lang(thousandsSep: ",")
      f.colors(["#fed907", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end
    
    @total_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30", "3/31"])
      f.series(name: "Total Cases", data: [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46, 50])

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    @total_cases_by_age_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: ["Teens", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89"])
      f.series(name: "Total Cases", data: [2, 9, 11, 8, 11, 6, 2, 1])

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    @total_cases_by_gender = LazyHighCharts::HighChart.new('graph') do |f|
      # f.xAxis(title: { enabled: false }, categories: ["Male", "Female"])
      f.series(name: "Total Cases", data: [ { name: 'Male', y: 19 }, { name: 'Female', y: 31 }])

      # f.yAxis [
      #   { title: { enabled: false }, allowDecimals: false },
      # ]
      f.colors(["#999999", "#666666"])
      f.chart({defaultSeriesType: "pie"})
    end

    @last_updated_on = Time.zone.parse("2020-03-31 19:48:00")
  end
end
