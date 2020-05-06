class DashboardController < ApplicationController
  def index

    @last_updated_on = Time.zone.parse("2020-05-05 7:16:00 PM")

    total_cases_by_day_categories = ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30", "3/31", "4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5"]
    total_cases_by_day_data = [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46, 50, 68, 78, 96, 106, 115, 125, 153, 192, 225, 252, 269, 292, 300, 346, 393, 451, 482, 505, 531, 540, 587, 645, 674, 706, 780, 802, 829, 857, 887, 924, 961, 986, 998, 1029, 1080]
    total_cases_by_day_max = 1100
    total_cases_by_day_tick_amount = 12
    new_cases_by_day_max = 80

    total_recoveries_by_day_data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 9, 9, 10, 10, 16, 18, 18, 20, 29, 33, 33, 35, 41, 44, 48, 62, 63, 64, 67, 70, 80, 100, 121, 122, 184, 185, 265, 295, 334, 397, 419, 455, 474, 486, 514]

    total_deaths_by_day_data = [1, 2, 2, 2, 2, 4, 6, 7, 7, 8, 8, 9, 9, 10, 10, 10, 12, 12, 12, 14, 18, 21, 22, 22, 22, 22, 22]
    total_deaths_by_day_max = 30
    
    patients_hospitalized_data = [19, 26, 27, 27, 27, 40, 48, 52, 48, 57, 58, 61, 65, 48, 38, 25, 29, 38, 37, 35, 33, 38, 36, 38, 35, 35, 52, 53, 58, 61, 59, 65, 71]
    patients_in_icu_data = [8, 8, 10, 10, 10, 12, 19, 21, 22, 23, 23, 26, 27, 10, 11, 10, 8, 13, 13, 18, 21, 26, 16, 18, 19, 19, 27, 31, 30, 39, 21, 38, 40]
    patients_max_value = 80

    total_cases_by_age_range_categories = ["12 & Under", "Teens", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89", "90-99"]
    total_cases_by_age_range_data = [49, 47, 205, 205, 158, 172, 135, 70, 26, 13]
    total_deaths_by_age_range_data = [0, 0, 0, 0, 0, 4, 6, 8, 3, 1]

    total_cases_by_gender_male = 511
    total_cases_by_gender_female = 569

    @total_cases_by_zip_code = [ [79821, "https://goo.gl/maps/fyDXByr3a6WyCLfh9", 2 ],
                                 [79835, "https://goo.gl/maps/WFSWehxhFTNPUVLb8", 30 ],
                                 [79836, "https://goo.gl/maps/mphTKm8jo7MZAmZN8", 6 ],
                                 [79838, "https://goo.gl/maps/LsXCW6txwEeGv4wH6", 10 ],
                                 [79849, "https://goo.gl/maps/48ZtmYoSB18FMxei9", 19 ],
                                 [79853, "https://goo.gl/maps/94CsB2nh12CsY12V7", 19 ],
                                 [79901, "https://goo.gl/maps/V8Pr5wRQvUwMYsLq8", 5 ],
                                 [79902, "https://goo.gl/maps/GhAYCydGe7sceeqBA", 13 ],
                                 [79903, "https://goo.gl/maps/njkWwDrBedvfJ3pdA", 40 ],
                                 [79904, "https://goo.gl/maps/ShNJW7b9ukMkgdsW9", 33 ],
                                 [79905, "https://goo.gl/maps/FaPYhZkQQivu5bpP7", 54 ],
                                 [79907, "https://goo.gl/maps/JU1tEasu4SF4Morf7", 51 ],
                                 [79911, "https://goo.gl/maps/ra1N74NDxhGZosh18", 7 ],
                                 [79912, "https://goo.gl/maps/Kz49kbnE2EzADkvt9", 82 ],
                                 [79915, "https://goo.gl/maps/kzwmzKxRakK6ssRa6", 44 ],
                                 [79922, "https://goo.gl/maps/a68MXDGZSk2jr9u7A", 5 ],
                                 [79924, "https://goo.gl/maps/U9yL1pJQTKv2riS56", 45 ],
                                 [79925, "https://goo.gl/maps/gTb8iXhw6RBuHPpu7", 43 ],
                                 [79927, "https://goo.gl/maps/nquJLGWtgKiU3Z4o7", 61 ],
                                 [79928, "https://goo.gl/maps/XwoKG1sLG1FiEBwE9", 75 ],
                                 [79930, "https://goo.gl/maps/uwWrGWqbYkCqTpv99", 32 ],
                                 [79932, "https://goo.gl/maps/YKuWPdsoiejNWvnh6", 46 ],
                                 [79934, "https://goo.gl/maps/ozgMKwoosWHWtDGPA", 28 ],
                                 [79935, "https://goo.gl/maps/jiS5uroU4meDaET68", 25 ],
                                 [79936, "https://goo.gl/maps/8bzvY2hcPK8qUcWu9", 144 ],
                                 [79938, "https://goo.gl/maps/jNF1sLZ61ubkvohR9", 161 ], ]

    zip_data = [[79821, [1, 1, 1, 1, 1,     1,  1 , 1,  1,  1,  1 , 1,  1,   1,  1,   1,   1,  1,  1,  1,  1,  1,  1,  1,  1,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2]],
                [79835,             [2,     2,  2 , 2,  2,  2,  2 , 2,  2,   3,  4,   6,   7,  7,  7,  7,  7,  7,  7,  8,  8,   12,  12,  13,  14,  19,  21,  27,  27,  27,  27,  30]],
                [79836, [                                                             1,   1,  1,  1,  2,  2,  2,  4,  4,  4,   4,   4,   4,   5,   5,   5,   5,   5,   5,   6,   6]],
                [79838, [                                           1,  1,   1,  1,   2,   3,  5,  5,  6,  6,  7,  8,  8,  8,   8,   8,   8,   8,   8,   8,   8,   9,   9,   9,   10]],
                [79849,    [1, 1, 1, 1,     1,  1 , 1,  2,  3,  3 , 3,  3,   3,  4,   5,   5,  5,  5,  6,  6,  6,  9,  11, 12,  16,  16,  15,  16,  16,  18,  18,  18,  18,  18,  19]],
                [79853,          [1, 1,     1,  1 , 2,  2,  2,  2 , 2,  2,   2,  2,   2,   3,  3,  4,  7,  7,  8,  8,  10, 10,  11,  12,  12,  12,  14,  15,  15,  16,  16,  16,  19]],
                [79901, [                                                                                                       1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   5]],
                [79902, [2, 2, 2, 2, 2,     2,  2 , 2,  2,  2,  2 , 2,  3,   3,  4,   6,   6,  6,  6,  6,  6,  7,  7,  7,  7,   9,   9,   10,  10,  10,  10,  11,  11,  11,  13,  13]],
                [79903, [                   1,  1 , 1,  2,  2,  2 , 5,  8,   8,  8,   9,   11, 11, 11, 12, 13, 14, 18, 22, 24,  27,  27,  31,  32,  35,  35,  38,  40,  40,  40,  40]],
                [79904, [3, 6, 7, 7, 8,     8,  8 , 8,  9,  9,  9 , 10, 10,  10, 10,  13,  14, 15, 15, 15, 15, 17, 20, 20, 20,  22,  22,  23,  23,  23,  24,  27,  28,  29,  31,  33]],
                [79905, [1, 2, 2, 3, 3,     3,  3 , 3,  10, 15, 15, 14, 16,  16, 17,  20,  23, 24, 24, 28, 29, 32, 36, 37, 38,  43,  43,  47,  48,  49,  50,  52,  52,  52,  53,  54]],
                [79907, [4, 4, 4, 5, 5,     5,  5 , 8,  8,  9,  9 , 11, 11,  11, 16,  19,  23, 24, 24, 26, 26, 28, 30, 31, 36,  38,  38,  41,  43,  45,  45,  45,  46,  47,  51,  51]],
                [79911, [2, 2, 3, 3, 3,     3,  3 , 3,  3,  3,  3 , 3,  3,   3,  3,   3,   3,  3,  3,  3,  3,  3,  3,  3,  4,   4,   6,   6,   6,   6,   6,   6,   6,   6,   6,   7]],
                [79912, [6, 7, 7, 8, 9,     9,  10, 12, 14, 20, 24, 25, 25,  27, 29,  32,  38, 39, 40, 40, 40, 44, 50, 53, 55,  59,  65,  67,  72,  73,  76,  76,  76,  77,  78,  82]],
                [79915, [1, 1, 1, 1, 1,     1,  2 , 4,  11, 12, 13, 13, 14,  15, 19,  23,  27, 28, 29, 31, 32, 32, 34, 35, 35,  37,  37,  36,  36,  36,  36,  37,  39,  39,  40,  44]],
                [79922, [                                           1,  1,   2,  2,   2,   4,  4,  4,  4,  4,  4,  4,  4,  4,   4,   4,   4,   4,   5,   5,   5,   5,   5,   5,   5]],
                [79924, [2, 2, 3, 3, 3,     3,  4 , 4,  8,  10, 12, 15, 15,  15, 18,  18,  21, 21, 22, 22, 22, 27, 28, 29, 33,  33,  33,  34,  37,  37,  38,  39,  41,  42,  42,  45]],
                [79925, [2, 3, 4, 5, 5,     5,  6 , 7,  7,  8,  9 , 9,  9,   9,  10,  10,  13, 13, 16, 18, 21, 24, 26, 26, 27,  30,  31,  31,  32,  33,  36,  37,  40,  40,  42,  43]],
                [79927, [3, 3, 5, 7, 8,     8,  8 , 10, 11, 12, 13, 15, 16,  16, 18,  18,  20, 20, 20, 20, 20, 24, 26, 27, 30,  39,  40,  43,  44,  47,  49,  52,  53,  53,  55,  61]],
                [79928, [8, 11, 11, 11, 13, 13, 14, 16, 18, 21, 22, 23, 25,  25, 28,  32,  36, 37, 39, 43, 44, 45, 47, 50, 52,  55,  57,  56,  59,  60,  64,  65,  66,  67,  68,  75]],
                [79930, [                               2,  2,  2 , 2,  3,   3,  4,   7,   8,  10, 12, 14, 14, 15, 18, 18, 19,  21,  22,  22,  22,  22,  27,  27,  27,  28,  28,  32]],
                [79932, [1, 2, 2, 6, 6,     7,  7 , 7,  7,  9,  11, 11, 11,  11, 15,  16,  19, 20, 20, 20, 20, 21, 25, 25, 27,  29,  29,  30,  31,  33,  35,  36,  38,  38,  38,  46]],
                [79934, [2, 3, 3, 3, 3,     4,  5 , 10, 12, 14, 14, 15, 16,  16, 17,  18,  20, 22, 22, 22, 22, 25, 26, 26, 26,  26,  26,  26,  26,  26,  27,  28,  28,  28,  28,  28]],
                [79935, [2, 3, 3, 4, 4,     4,  5 , 9,  10, 11, 11, 12, 13,  13, 14,  16,  14, 15, 17, 18, 18, 20, 20, 20, 23,  25,  25,  26,  26,  26,  26,  26,  26,  26,  26,  25]],
                [79936, [5, 7, 9, 13, 16,   19, 20, 23, 27, 30, 38, 42, 48,  49, 57,  66,  72, 77, 84, 85, 86, 91, 96, 98, 101, 115, 117, 121, 124, 129, 135, 138, 140, 141, 149, 144]],
                [79938, [5, 8, 10, 12, 12,  15, 17, 20, 24, 28, 35, 32, 36,  38, 45,  48,  59, 71, 74, 75, 76, 83, 94, 101,102, 110, 116, 120, 124, 127, 130, 140, 146, 151, 157, 161]],
                ]

    zip_data_tick_amount = 8

    @links = [ ["City of El Paso Facebook - May 5, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/case-numbers-continue-increasing-residents-urged-to-wear-face-coverings/2998656446840445/"],
               ["City of El Paso Facebook - May 4, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-positive-cases-reach-over-one-thousand/2996223767083713/"],
               ["City of El Paso Facebook - May 3, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/hospitalizations-numbers-decrease-community-reminded-to-remain-vigilant/2993828630656560/"],
               ["City of El Paso Facebook - May 2, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-officials-urge-residents-to-abide-by-directive/2991387660900657/"],
               ["City of El Paso Facebook - May 1, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-one-covid-19-death-urges-residents-to-abide-local-directive/2989215137784576/"],
               ["City of El Paso Facebook - April 30, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-3-deaths-amends-directives-and-expands-testing/2986507024722054/"],
               ["City of El Paso Facebook - April 29, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-four-additional-deaths-urges-caution-as-directives-changed/2983956864977070/"],
               ["City of El Paso Facebook - April 28, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-county-to-amend-local-directive-report-two-deaths/2981770255195731/"],
               ["City of El Paso Facebook - April 27, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reviews-states-phased-plan-to-reopen-texas/2978956308810459/"],
               ["City of El Paso Facebook - April 26, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-recovery-numbers-rising-vulnerable-residents-still-at-risk/2976831909022899/"],
               ["City of El Paso Facebook - April 25, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reports-large-increase-two-deaths/2974481669257923/"],
               ["City of El Paso Facebook - April 24, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-residents-urged-to-abide-by-amended-directive-to-reduce-the-spre/2972383936134363/"],
               ["City of El Paso Facebook - April 23, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/emergency-directives-amended-aimed-at-reducing-spread-of-covid-19/2969708026401954/"],
               ["City of El Paso Facebook - April 22, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-reports-one-additional-covid-19-death/2967347239971366/"],
               ["City of El Paso Facebook - April 21, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-moves-into-phase-iii-for-drive-thru-specimen-collection/2964709783568445/"],
               ["City of El Paso Facebook - April 20, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-reports-one-covid-19-death-additional-cases/2962203613819062/"],
               ["City of El Paso Facebook - April 19, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/residents-urged-not-to-become-complacent/2959832750722815/"],
               ["City of El Paso Facebook - April 18, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-officials-report-additional-covid-19-death/2957418227630934/"],
               ["City of El Paso Facebook - April 17, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-state-parks-in-el-paso-to-remain-closed/2955366294502794/"],
               ["City of El Paso Facebook - April 16, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reports-one-additional-covid-19-death/2952784154761008/"],
               ["City of El Paso Facebook - April 15, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reports-two-additional-covid-19-deaths/2950272395012184/"],
               ["City of El Paso Facebook - April 14, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reports-two-additional-covid-19-deaths/2948122258560531/"],
               ["City of El Paso Facebook - April 13, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-officials-warn-residents-to-comply/2945502088822548/"],
               ["City of El Paso Facebook - April 12, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-reports-increase-in-positive-cases/2943092272396863/"],
               ["City of El Paso Facebook - April 11, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-el-paso-positive-cases-increase/2940750515964372/"],
               ["City of El Paso Facebook - April 10, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/second-covid-19-death-in-el-paso/2938552939517463/"],
               ["City of El Paso Facebook - April 9, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/first-covid-19-death-in-el-paso/2936167889755968/"],
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
    @total_recoveries = total_recoveries_by_day_data.last
    @total_deaths = total_deaths_by_day_data.last
    @new_cases = total_cases_by_day_data.last(2)[1] - total_cases_by_day_data.last(2)[0]
    @new_deaths = total_deaths_by_day_data.last(2)[1] - total_deaths_by_day_data.last(2)[0]

    total_deaths_by_day_categories = total_cases_by_day_categories.last(total_deaths_by_day_data.size)
    patients_hospitalized_categories = total_cases_by_day_categories.last(patients_in_icu_data.size)
    patients_in_icu_categories = total_cases_by_day_categories.last(patients_in_icu_data.size)
    zip_data_categories_1 = total_cases_by_day_categories.last(zip_data[0][1].size)

    zip_data_max_value = @total_cases_by_zip_code.map { |entry| entry[2] }.max
    
    ##### Globals

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.chart(style: { fontFamily: '\'Inter\', sans-serif'})
      f.lang(thousandsSep: ",")
      f.colors(["#fed907", "#f70000", "#8085e9", "#f15c80", "#e4d354"])
    end

    ##### Total Cases and Recoveries by Day
    
    @total_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories)
      f.series(name: "Total Cases", data: total_cases_by_day_data)
      f.series(name: "Total Recoveries", data: total_recoveries_by_day_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: total_cases_by_day_max, tickAmount: total_cases_by_day_tick_amount },
      ]

      f.colors(["#fed907", "#26dc4e"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "area"})
    end

    ##### New Cases by Day
    
    new_cases_by_day_data = []
    new_recoveries_by_day_data = []

    for i in (1..total_cases_by_day_data.size - 1)
      new_cases_by_day_data += [total_cases_by_day_data[i] - total_cases_by_day_data[i - 1]]
    end

    for i in (1..total_recoveries_by_day_data.size - 1)
      new_recoveries_by_day_data += [total_recoveries_by_day_data[i] - total_recoveries_by_day_data[i - 1]]
    end

    @new_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories.drop(1))
      f.series(name: "New Cases", data: new_cases_by_day_data)
      # f.series(name: "New Recoveries", data: new_recoveries_by_day_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: new_cases_by_day_max },
      ]

      f.colors(["#fed907", "#26dc4e"])
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    ##### Total Deaths by Day
    
    @total_deaths_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_deaths_by_day_categories)
      f.series(name: "Total Deaths", data: total_deaths_by_day_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: total_deaths_by_day_max },
      ]

      f.colors(["#f70000"])
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 300})
    end

    ##### Total Cases by Age Range

    @total_cases_by_age_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_age_range_categories)
      f.series(name: "Total Cases", data: total_cases_by_age_range_data)
      f.series(name: "Total Deaths", data: total_deaths_by_age_range_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: 200 },
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

    ##### Patients in Hospital
    
    @patients_hospitalized = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: patients_hospitalized_categories)
      f.series(name: "Patients", data: patients_hospitalized_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: patients_max_value, tickAmount: 5 },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 300})
    end

    ##### Patients in ICU
    
    @patients_in_icu = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: patients_in_icu_categories)
      f.series(name: "Patients", data: patients_in_icu_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: patients_max_value, tickAmount: 5 },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 300})
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
          { title: { enabled: false }, allowDecimals: false, max: zip_data_max_value, tickAmount: zip_data_tick_amount },
        ]

        f.legend(enabled: false)
        f.chart({defaultSeriesType: "line", height: 200})
      end
    end

  end
end
