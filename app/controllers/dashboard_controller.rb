class DashboardController < ApplicationController
  def index

    @last_updated_on = Time.zone.parse("2020-04-01 09:20:00 PM")
    @total_cases = 68

    total_cases_by_day_categories = ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30", "3/31", "4/1"]
    total_cases_by_day_data = [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46, 50, 68]

    total_cases_by_age_range_categories = ["Teens", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89"]
    total_cases_by_age_range_data = [2, 15, 12, 10, 13, 8, 7, 1]

    total_cases_by_gender_male = 30
    total_cases_by_gender_female = 38

    @total_cases_by_zip_code = [ [79821, 1],
                                 [79849, 1],
                                 [79902, 2],
                                 [79904, 6],
                                 [79905, 2],
                                 [79907, 4],
                                 [79911, 2],
                                 [79912, 7],
                                 [79915, 1],
                                 [79924, 2],
                                 [79925, 3],
                                 [79927, 3],
                                 [79928, 11],
                                 [79932, 2],
                                 [79934, 3],
                                 [79935, 3],
                                 [79936, 7],
                                 [79938, 8], ]

    max_value = @total_cases_by_zip_code.map { |entry| entry[1] }.max

    zip_data_categories_1 = ["3/31", "4/1"]

    zip_data = [[79821, [1, 2]],
                [79849, [1]],
                [79902, [2, 2]],
                [79904, [3, 6]],
                [79905, [1, 2]],
                [79907, [4, 4]],
                [79911, [2, 2]],
                [79912, [6, 7]],
                [79915, [1, 1]],
                [79924, [2, 2]],
                [79925, [2, 3]],
                [79927, [3, 3]],
                [79928, [8, 11]],
                [79932, [1, 2]],
                [79934, [2, 3]],
                [79935, [2, 3]],
                [79936, [5, 7]],
                [79938, [5, 8]],
                ]

    ##### Globals

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.chart(style: { fontFamily: '\'Inter\', sans-serif'})
      f.lang(thousandsSep: ",")
      f.colors(["#fed907", "#999999", "#8085e9", "#f15c80", "#e4d354"])
    end

    ##### Total Cases by Day
    
    @total_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories)
      f.series(name: "Total Cases", data: total_cases_by_day_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    ##### Total Cases by Age Range

    @total_cases_by_age_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_age_range_categories)
      f.series(name: "Total Cases", data: total_cases_by_age_range_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 300})
    end

    ##### Total Cases by Gender

    @total_cases_by_gender = LazyHighCharts::HighChart.new('graph') do |f|
      # f.xAxis(title: { enabled: false }, categories: ["Male", "Female"])
      f.series(name: "Total Cases", data: [ { name: 'Male', y: total_cases_by_gender_male }, { name: 'Female', y: total_cases_by_gender_female }])

      # f.yAxis [
      #   { title: { enabled: false }, allowDecimals: false },
      # ]
      f.colors(["#999999", "#666666"])
      f.chart({defaultSeriesType: "pie", height: 300})
    end

    ##### Total Cases by Zip Code

    @total_cases_by_individual_zip_code = Hash.new

    for entry in zip_data
      zip_code = entry[0]
      data = entry[1]

      @total_cases_by_individual_zip_code[zip_code] = LazyHighCharts::HighChart.new('graph') do |f|
        f.xAxis(title: { enabled: false }, categories: zip_data_categories_1.drop(zip_data_categories_1.size - data.size))
        f.series(name: "Total Cases", data: data)

        f.yAxis [
          { title: { enabled: false }, allowDecimals: false, max: max_value },
        ]

        f.legend(enabled: false)
        f.chart({defaultSeriesType: "column", height: 200})
      end
    end

  end
end
