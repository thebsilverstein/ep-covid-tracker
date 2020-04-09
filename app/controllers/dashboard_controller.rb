class DashboardController < ApplicationController
  def index

    @last_updated_on = Time.zone.parse("2020-04-09 5:05:00 PM")

    total_cases_by_day_categories = ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30", "3/31", "4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9"]
    total_cases_by_day_data = [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46, 50, 68, 78, 96, 106, 115, 125, 153, 192, 225]

    total_deaths_by_day_categories = ["4/9"]
    total_deaths_by_day_data = [1]

    total_cases_by_age_range_categories = ["12 & Under", "Teens", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89", "90-99"]
    total_cases_by_age_range_data = [3, 7, 34, 41, 34, 32, 20, 13, 4, 4]

    total_cases_by_gender_male = 91
    total_cases_by_gender_female = 101

    @total_cases_by_zip_code = [ [79821, "https://goo.gl/maps/fyDXByr3a6WyCLfh9", 1 ],
                                 [79835, "https://goo.gl/maps/WFSWehxhFTNPUVLb8", 2 ],
                                 [79849, "https://goo.gl/maps/48ZtmYoSB18FMxei9", 2 ],
                                 [79853, "https://goo.gl/maps/94CsB2nh12CsY12V7", 2 ],
                                 [79902, "https://goo.gl/maps/GhAYCydGe7sceeqBA", 2 ],
                                 [79903, "https://goo.gl/maps/njkWwDrBedvfJ3pdA", 2 ],
                                 [79904, "https://goo.gl/maps/ShNJW7b9ukMkgdsW9", 9 ],
                                 [79905, "https://goo.gl/maps/FaPYhZkQQivu5bpP7", 10 ],
                                 [79907, "https://goo.gl/maps/JU1tEasu4SF4Morf7", 8 ],
                                 [79911, "https://goo.gl/maps/ra1N74NDxhGZosh18", 3 ],
                                 [79912, "https://goo.gl/maps/Kz49kbnE2EzADkvt9", 14 ],
                                 [79915, "https://goo.gl/maps/kzwmzKxRakK6ssRa6", 11 ],
                                 [79924, "https://goo.gl/maps/U9yL1pJQTKv2riS56", 8 ],
                                 [79925, "https://goo.gl/maps/gTb8iXhw6RBuHPpu7", 7 ],
                                 [79927, "https://goo.gl/maps/nquJLGWtgKiU3Z4o7", 11 ],
                                 [79928, "https://goo.gl/maps/XwoKG1sLG1FiEBwE9", 18 ],
                                 [79930, "https://goo.gl/maps/uwWrGWqbYkCqTpv99", 2 ],
                                 [79932, "https://goo.gl/maps/YKuWPdsoiejNWvnh6", 7 ],
                                 [79934, "https://goo.gl/maps/ozgMKwoosWHWtDGPA", 12 ],
                                 [79935, "https://goo.gl/maps/jiS5uroU4meDaET68", 10 ],
                                 [79936, "https://goo.gl/maps/8bzvY2hcPK8qUcWu9", 27 ],
                                 [79938, "https://goo.gl/maps/jNF1sLZ61ubkvohR9", 24 ], ]

    # zip_data_categories_1 = total_cases_by_day_categories.drop(18)
    zip_data_categories_1 = ["3/31", "4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8"]

    zip_data = [[79821, [1, 1, 1, 1, 1,     1,  1 , 1,  1,  ]],
                [79835,             [2,     2,  2 , 2,  2,  ]],
                [79849,    [1, 1, 1, 1,     1,  1 , 1,  2,  ]],
                [79853,          [1, 1,     1,  1 , 2,  2,  ]],
                [79902, [2, 2, 2, 2, 2,     2,  2 , 2,  2,  ]],
                [79903, [                   1,  1 , 1,  2,  ]],
                [79904, [3, 6, 7, 7, 8,     8,  8 , 8,  9,  ]],
                [79905, [1, 2, 2, 3, 3,     3,  3 , 3,  10, ]],
                [79907, [4, 4, 4, 5, 5,     5,  5 , 8,  8,  ]],
                [79911, [2, 2, 3, 3, 3,     3,  3 , 3,  3,  ]],
                [79912, [6, 7, 7, 8, 9,     9,  10, 12, 14, ]],
                [79915, [1, 1, 1, 1, 1,     1,  2 , 4,  11, ]],
                [79924, [2, 2, 3, 3, 3,     3,  4 , 4,  8,  ]],
                [79925, [2, 3, 4, 5, 5,     5,  6 , 7,  7,  ]],
                [79927, [3, 3, 5, 7, 8,     8,  8 , 10, 11, ]],
                [79928, [8, 11, 11, 11, 13, 13, 14, 16, 18, ]],
                [79930, [                               2,  ]],
                [79932, [1, 2, 2, 6, 6,     7,  7 , 7,  7,  ]],
                [79934, [2, 3, 3, 3, 3,     4,  5 , 10, 12, ]],
                [79935, [2, 3, 3, 4, 4,     4,  5 , 9,  10, ]],
                [79936, [5, 7, 9, 13, 16,   19, 20, 23, 27, ]],
                [79938, [5, 8, 10, 12, 12,  15, 17, 20, 24, ]],
                ]

    @links = [ 
               ["City of El Paso Facebook - April 8, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-positive-cases-continue-to-climb/2933837686655655/"],
               ["City of El Paso Facebook - April 7, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/el-paso-sees-largest-spike-in-covid-19-cases/2931741400198617/"],
               ["City of El Paso Facebook - April 6, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-ten-new-cases-new-safety-recommendations/2929484987090925/"],
               ["City of El Paso Facebook - April 5, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-identifies-additional-covid-19-cases/2927135207325903/"],
               ["City of El Paso Facebook - April 4, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-reaches-triple-digits-in-positive-cases/2924932514212839/"],
               ["City of El Paso Facebook - April 3, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-identifies-additional-covid-19-cases/2923000401072717/"],
               ["City of El Paso Facebook - April 2, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-identifies-additional-covid-19-cases/2920931354612955/"],
               ["City of El Paso Facebook - April 1, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-amends-emergency-directive-aimed-at-reducing-spread-of-covid-19/2918569611515796/"],
               ["City of El Paso Facebook - March 31, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-identifies-additional-covid-19-cases/2916368208402603/"],
               ["El Paso Matters - March 30, 2020", "https://elpasomatters.org/2020/03/30/el-paso-has-begun-showing-general-location-of-covid-19-positive-tests/"]
             ]

    @total_cases = total_cases_by_day_data.last
    @total_deaths = total_deaths_by_day_data.last
    @new_cases = total_cases_by_day_data.last(2)[1] - total_cases_by_day_data.last(2)[0]
    @new_deaths = 1#total_deaths_by_day_data.last(2)[1] - total_deaths_by_day_data.last(2)[0]
    max_value = @total_cases_by_zip_code.map { |entry| entry[2] }.max

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

    ##### Total Deaths by Day
    
    @total_deaths_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_deaths_by_day_categories)
      f.series(name: "Total Deaths", data: total_deaths_by_day_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: 10 },
      ]

      f.colors(["#f70000"])
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
      f.chart({defaultSeriesType: "bar", height: 300})
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
