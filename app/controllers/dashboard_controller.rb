class DashboardController < ApplicationController
  def index
    @total_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30"])
      f.series(name: "Total Cases", data: [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46])

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

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
      f.colors(["#777777", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end
  end
end
