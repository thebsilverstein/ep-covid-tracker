require 'facets/array/pad'

class DashboardController < ApplicationController
  def index

    @last_updated_on = Time.zone.parse("2020-06-16 7:41:00")

    total_cases_by_day_categories = ["3/13", "3/14", "3/15", "3/16", "3/17", "3/18", "3/19", "3/20", "3/21", "3/22", "3/23", "3/24", "3/25", "3/26", "3/27", "3/28", "3/29", "3/30", "3/31", "4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7", "5/8", "5/9", "5/10", "5/11", "5/12", "5/13", "5/14", "5/15", "5/16", "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23", "5/24", "5/25", "5/26", "5/27", "5/28", "5/29", "5/30", "5/31", "6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8", "6/9", "6/10", "6/11", "6/12", "6/13", "6/14", "6/15", "6/16"]
    
    total_cases_by_day_data = [1, 1, 2, 3, 3, 3, 6, 6, 6, 6, 10, 12, 21, 25, 30, 35, 40, 46, 50, 68, 78, 96, 106, 115, 125, 153, 192, 225, 252, 269, 292, 300, 346, 393, 451, 482, 505, 531, 540, 587, 645, 674, 706, 780, 802, 829, 857, 887, 924, 961, 986, 998, 1029, 1080, 1119, 1190, 1276, 1322, 1340, 1348, 1413, 1456, 1607, 1655, 1726, 1772, 1800, 1852, 1930, 2046, 2160, 2265, 2340, 2376, 2393, 2461, 2569, 2623, 2704, 2764, 2794, 2833, 2872, 3069, 3213, 3298, 3376, 3453, 3512, 3582, 3650, 3695, 3794, 3834, 3911, 3948]
    total_cases_by_day_max = 4500
    total_cases_by_day_tick_amount = 10
    new_cases_by_day_max = 220
    new_cases_by_day_tick_amount = 10

    total_recoveries_by_day_data = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 5, 9, 9, 10, 10, 16, 18, 18, 20, 29, 33, 33, 35, 41, 44, 48, 62, 63, 64, 67, 70, 80, 100, 121, 122, 184, 185, 265, 295, 334, 397, 419, 455, 474, 486, 514, 559, 619, 643, 672, 685, 685, 719, 751, 793, 819, 882, 903, 921, 984, 1028, 1106, 1157, 1208, 1237, 1267, 1335, 1385, 1465, 1508, 1602, 1618, 1621, 1704, 1797, 1921, 2133, 2241, 2266, 2290, 2369, 2430, 2538, 2600, 2681, 2712, 2732, 2795]

    total_deaths_by_day_categories = ["4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7", "5/8", "5/9", "5/10", "5/11", "5/12", "5/13", "5/14", "5/15", "5/16", "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23", "5/24", "5/25", "5/26", "5/27", "5/28", "5/29", "5/30", "5/31", "6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8", "6/9", "6/10", "6/11", "6/12", "6/13", "6/14", "6/15", "6/16"]
    total_deaths_by_day_data = [1, 2, 2, 2, 2, 4, 6, 7, 7, 8, 8, 9, 9, 10, 10, 10, 12, 12, 12, 14, 18, 21, 22, 22, 22, 22, 22, 23, 30, 32, 32, 33, 33, 36, 41, 43, 45, 46, 47, 47, 52, 54, 57, 58, 58, 58, 58, 60, 68, 72, 77, 78, 78, 80, 83, 88, 89, 90, 90, 90, 91, 93, 93, 97, 98, 100, 100, 102, 109]
    total_deaths_by_day_max = 120
    
    patients_hospitalized_categories = ["4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7", "5/8", "5/9", "5/10", "5/11", "5/12", "5/13", "5/14", "5/15", "5/16", "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23", "5/24", "5/25", "5/26", "5/27", "5/28", "5/29", "5/30", "5/31", "6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8", "6/9", "6/10", "6/11", "6/12", "6/13", "6/14", "6/15", "6/16"]
    patients_in_icu_categories = ["4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7", "5/8", "5/9", "5/10", "5/11", "5/12", "5/13", "5/14", "5/15", "5/16", "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23", "5/24", "5/25", "5/26", "5/27", "5/28", "5/29", "5/30", "5/31", "6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8", "6/9", "6/10", "6/11", "6/12", "6/13", "6/14", "6/15", "6/16"]
    patients_hospitalized_data = [19, 26, 27, 27, 27, 40, 48, 52, 48, 57, 58, 61, 65, 48, 38, 25, 29, 38, 37, 35, 33, 38, 36, 38, 35, 35, 52, 53, 58, 61, 59, 65, 71, 68, 62, 83, 82, 85, 80, 80, 73, 76, 74, 78, 74, 77, 107, 109, 109, 119, 116, 109, 112, 106, 110, 118, 111, 106, 103, 99, 96, 91, 106, 98, 98, 87, 96, 95, 82, 81, 85, 88, 85, 78, 87]
    patients_in_icu_data = [8, 8, 10, 10, 10, 12, 19, 21, 22, 23, 23, 26, 27, 10, 11, 10, 8, 13, 13, 18, 21, 26, 16, 18, 19, 19, 27, 31, 30, 39, 21, 38, 40, 39, 40, 47, 40, 39, 34, 40, 35, 38, 39, 41, 32, 35, 46, 52, 56, 65, 66, 61, 66, 67, 65, 67, 67, 59, 54, 56, 59, 54, 63, 54, 56, 53, 64, 61, 59, 54, 45, 51, 51, 50, 51]
    patients_max_value = 120
    patients_tick_amount = 6

    total_cases_by_age_range_categories = ["12 & Under", "Teens", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", "80-89", "90-99", "100-109"]
    total_cases_by_age_range_data = [184, 189, 785, 743, 604, 607, 428, 221, 132, 53, 2]
    total_cases_by_age_range_max = 800

    total_deaths_by_age_range_data = [0, 0, 1, 1, 7, 17, 28, 25, 19, 11, 0]
    total_deaths_by_age_range_max = 50

    total_cases_by_gender_male = 2025
    total_cases_by_gender_female = 1923

    zip_data_categories_1 = ["3/31", "4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10", "4/11", "4/12", "4/13", "4/14", "4/15", "4/16", "4/17", "4/18", "4/19", "4/20", "4/21", "4/22", "4/23", "4/24", "4/25", "4/26", "4/27", "4/28", "4/29", "4/30", "5/1", "5/2", "5/3", "5/4", "5/5", "5/6", "5/7", "5/8", "5/9", "5/10", "5/11", "5/12", "5/13", "5/14", "5/15", "5/16", "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23", "5/24", "5/25", "5/26", "5/27", "5/28", "5/29", "5/30", "5/31", "6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8", "6/9", "6/10", "6/11", "6/12", "6/13", "6/14", "6/15"]

    @total_cases_by_zip_code = [ [79821, "https://goo.gl/maps/fyDXByr3a6WyCLfh9", 19  ],
                                 [79835, "https://goo.gl/maps/WFSWehxhFTNPUVLb8", 116 ],
                                 [79836, "https://goo.gl/maps/mphTKm8jo7MZAmZN8", 32  ],
                                 [79838, "https://goo.gl/maps/LsXCW6txwEeGv4wH6", 32  ],
                                 [79849, "https://goo.gl/maps/48ZtmYoSB18FMxei9", 83  ],
                                 [79853, "https://goo.gl/maps/94CsB2nh12CsY12V7", 32  ],
                                 [79901, "https://goo.gl/maps/V8Pr5wRQvUwMYsLq8", 72  ],
                                 [79902, "https://goo.gl/maps/GhAYCydGe7sceeqBA", 153 ],
                                 [79903, "https://goo.gl/maps/njkWwDrBedvfJ3pdA", 143 ],
                                 [79904, "https://goo.gl/maps/ShNJW7b9ukMkgdsW9", 113 ],
                                 [79905, "https://goo.gl/maps/FaPYhZkQQivu5bpP7", 140 ],
                                 [79907, "https://goo.gl/maps/JU1tEasu4SF4Morf7", 217 ],
                                 [79911, "https://goo.gl/maps/ra1N74NDxhGZosh18", 21  ],
                                 [79912, "https://goo.gl/maps/Kz49kbnE2EzADkvt9", 264 ],
                                 [79915, "https://goo.gl/maps/kzwmzKxRakK6ssRa6", 144 ],
                                 [79922, "https://goo.gl/maps/a68MXDGZSk2jr9u7A", 20  ],
                                 [79924, "https://goo.gl/maps/U9yL1pJQTKv2riS56", 195 ],
                                 [79925, "https://goo.gl/maps/gTb8iXhw6RBuHPpu7", 228 ],
                                 [79927, "https://goo.gl/maps/nquJLGWtgKiU3Z4o7", 243 ],
                                 [79928, "https://goo.gl/maps/XwoKG1sLG1FiEBwE9", 295 ],
                                 [79930, "https://goo.gl/maps/uwWrGWqbYkCqTpv99", 111 ],
                                 [79932, "https://goo.gl/maps/YKuWPdsoiejNWvnh6", 107 ],
                                 [79934, "https://goo.gl/maps/ozgMKwoosWHWtDGPA", 62  ],
                                 [79935, "https://goo.gl/maps/jiS5uroU4meDaET68", 63  ],
                                 [79936, "https://goo.gl/maps/8bzvY2hcPK8qUcWu9", 423 ],
                                 [79938, "https://goo.gl/maps/jNF1sLZ61ubkvohR9", 583 ], ]

    zip_data = [[79821, [1, 1, 1, 1, 1,     1,  1 , 1,  1,  1,  1 , 1,  1,   1,  1,   1,   1,  1,  1,  1,  1,  1,  1,  1,  1,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   3,   4,   4,   4,   4,   6,   6,   6,   7,   7,   8,   8,   8,   8,   8,   8,   9,   10,  10,  10,  10,  10,  11,  12,  14,  15,  15,  15,  17,  18,  18,  18,  18,  18,  18,  19,  19,  19,  19,  ]],
                [79835,             [2,     2,  2 , 2,  2,  2,  2 , 2,  2,   3,  4,   6,   7,  7,  7,  7,  7,  7,  7,  8,  8,   12,  12,  13,  14,  19,  21,  27,  27,  27,  27,  30,  32,  34,  37,  39,  39,  39,  43,  46,  48,  48,  53,  54,  54,  54,  57,  59,  60,  61,  62,  63,  66,  69,  74,  74,  76,  77,  79,  82,  83,  88,  92,  94,  98,  101, 102, 104, 106, 110, 110, 112, 116, ]],
                [79836, [                                                             1,   1,  1,  1,  2,  2,  2,  4,  4,  4,   4,   4,   4,   5,   5,   5,   5,   5,   5,   6,   6,   7,   7,   9,   10,  10,  10,  10,  10,  10,  10,  12,  12,  12,  12,  12,  13,  15,  15,  15,  15,  15,  17,  17,  20,  20,  21,  21,  19,  19,  22,  23,  23,  23,  27,  27,  28,  29,  31,  31,  31,  32,  ]],
                [79838, [                                           1,  1,   1,  1,   2,   3,  5,  5,  6,  6,  7,  8,  8,  8,   8,   8,   8,   8,   8,   8,   8,   9,   9,   9,   10,  10,  12,  13,  13,  13,  13,  14,  15,  18,  18,  18,  18,  18,  20,  20,  21,  22,  24,  24,  24,  24,  25,  26,  27,  28,  28,  28,  28,  28,  29,  30,  30,  31,  31,  31,  31,  32,  32,  32,  32,  32,  ]],
                [79849,    [1, 1, 1, 1,     1,  1 , 1,  2,  3,  3 , 3,  3,   3,  4,   5,   5,  5,  5,  6,  6,  6,  9,  11, 12,  16,  16,  15,  16,  16,  18,  18,  18,  18,  18,  19,  22,  22,  23,  23,  23,  23,  25,  26,  31,  38,  38,  40,  41,  42,  50,  52,  53,  54,  56,  56,  56,  56,  58,  58,  58,  58,  58,  61,  62,  67,  67,  69,  74,  74,  74,  75,  76,  76,  79,  81,  83,  ]],
                [79853,          [1, 1,     1,  1 , 2,  2,  2,  2 , 2,  2,   2,  2,   2,   3,  3,  4,  7,  7,  8,  8,  10, 10,  11,  12,  12,  12,  14,  15,  15,  16,  16,  16,  19,  19,  20,  23,  23,  23,  23,  24,  24,  27,  27,  27,  27,  27,  27,  27,  27,  27,  28,  28,  28,  28,  28,  28,  30,  30,  30,  30,  30,  30,  32,  32,  32,  32,  32,  32,  32,  32,  32,  32,  32,  32,  ]],
                [79901, [                                                                                                       1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   5,   5,   6,   9,   12,  12,  12,  15,  16,  20,  21,  21,  22,  22,  25,  28,  28,  36,  40,  43,  44,  44,  46,  48,  48,  49,  50,  50,  53,  54,  55,  56,  59,  60,  63,  63,  65,  68,  70,  70,  70,  72,  ]],
                [79902, [2, 2, 2, 2, 2,     2,  2 , 2,  2,  2,  2 , 2,  3,   3,  4,   6,   6,  6,  6,  6,  6,  7,  7,  7,  7,   9,   9,   10,  10,  10,  10,  11,  11,  11,  13,  13,  13,  13,  14,  15,  16,  16,  18,  18,  24,  34,  36,  36,  36,  39,  40,  43,  77,  106, 114, 117, 117, 121, 122, 123, 124, 124, 125, 124, 124, 130, 131, 133, 136, 137, 139, 143, 147, 147, 151, 151, 153, ]],
                [79903, [                   1,  1 , 1,  2,  2,  2 , 5,  8,   8,  8,   9,   11, 11, 11, 12, 13, 14, 18, 22, 24,  27,  27,  31,  32,  35,  35,  38,  40,  40,  40,  40,  42,  43,  44,  44,  46,  46,  46,  47,  54,  54,  54,  55,  55,  56,  58,  63,  69,  72,  73,  73,  73,  79,  81,  81,  83,  84,  86,  85,  85,  86,  88,  96,  119, 120, 120, 123, 127, 128, 141, 142, 143, ]],
                [79904, [3, 6, 7, 7, 8,     8,  8 , 8,  9,  9,  9 , 10, 10,  10, 10,  13,  14, 15, 15, 15, 15, 17, 20, 20, 20,  22,  22,  23,  23,  23,  24,  27,  28,  29,  31,  33,  34,  37,  38,  39,  41,  41,  42,  44,  49,  51,  52,  53,  55,  55,  58,  59,  62,  64,  65,  66,  66,  67,  71,  73,  73,  74,  76,  77,  81,  88,  93,  96,  97,  101, 101, 101, 108, 108, 109, 110, 113, ]],
                [79905, [1, 2, 2, 3, 3,     3,  3 , 3,  10, 15, 15, 14, 16,  16, 17,  20,  23, 24, 24, 28, 29, 32, 36, 37, 38,  43,  43,  47,  48,  49,  50,  52,  52,  52,  53,  54,  56,  58,  64,  64,  59,  59,  60,  60,  62,  65,  69,  70,  71,  76,  76,  79,  83,  88,  89,  93,  96,  97,  105, 110, 110, 114, 114, 115, 115, 120, 121, 123, 126, 128, 129, 132, 133, 136, 137, 140, 140, ]],
                [79907, [4, 4, 4, 5, 5,     5,  5 , 8,  8,  9,  9 , 11, 11,  11, 16,  19,  23, 24, 24, 26, 26, 28, 30, 31, 36,  38,  38,  41,  43,  45,  45,  45,  46,  47,  51,  51,  52,  56,  62,  64,  66,  67,  76,  79,  86,  91,  94,  98,  102, 107, 110, 118, 124, 128, 132, 132, 132, 139, 146, 147, 151, 151, 153, 155, 166, 176, 183, 184, 190, 191, 197, 200, 201, 201, 206, 209, 217, ]],
                [79911, [2, 2, 3, 3, 3,     3,  3 , 3,  3,  3,  3 , 3,  3,   3,  3,   3,   3,  3,  3,  3,  3,  3,  3,  3,  4,   4,   6,   6,   6,   6,   6,   6,   6,   6,   6,   7,   7,   8,   7,   8,   8,   8,   8,   8,   8,   11,  11,  11,  11,  11,  11,  11,  11,  12,  12,  12,  12,  12,  12,  13,  13,  13,  13,  13,  14,  14,  15,  15,  16,  18,  19,  19,  19,  20,  21,  21,  21,  ]],
                [79912, [6, 7, 7, 8, 9,     9,  10, 12, 14, 20, 24, 25, 25,  27, 29,  32,  38, 39, 40, 40, 40, 44, 50, 53, 55,  59,  65,  67,  72,  73,  76,  76,  76,  77,  78,  82,  82,  84,  91,  97,  99,  101, 102, 103, 115, 116, 118, 121, 123, 126, 135, 151, 160, 169, 175, 178, 179, 185, 194, 200, 202, 209, 212, 212, 215, 231, 229, 236, 242, 244, 246, 251, 253, 256, 258, 262, 264, ]],
                [79915, [1, 1, 1, 1, 1,     1,  2 , 4,  11, 12, 13, 13, 14,  15, 19,  23,  27, 28, 29, 31, 32, 32, 34, 35, 35,  37,  37,  36,  36,  36,  36,  37,  39,  39,  40,  44,  49,  51,  55,  59,  60,  60,  64,  67,  76,  76,  77,  81,  82,  83,  85,  91,  97,  98,  103, 103, 102, 103, 103, 106, 108, 108, 110, 112, 113, 117, 119, 122, 123, 125, 125, 129, 131, 136, 140, 141, 144, ]],
                [79922, [                                           1,  1,   2,  2,   2,   4,  4,  4,  4,  4,  4,  4,  4,  4,   4,   4,   4,   4,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   6,   6,   6,   7,   7,   10,  9,   10,  10,  10,  10,  11,  12,  12,  12,  13,  13,  13,  13,  13,  14,  15,  17,  18,  18,  18,  19,  19,  19,  20,  20,  20,  20,  20,  20,  20,  20,  20,  ]],
                [79924, [2, 2, 3, 3, 3,     3,  4 , 4,  8,  10, 12, 15, 15,  15, 18,  18,  21, 21, 22, 22, 22, 27, 28, 29, 33,  33,  33,  34,  37,  37,  38,  39,  41,  42,  42,  45,  52,  57,  64,  67,  68,  68,  72,  76,  88,  88,  102, 107, 108, 114, 115, 123, 121, 126, 129, 131, 132, 136, 139, 144, 148, 153, 154, 156, 158, 165, 171, 174, 175, 178, 179, 180, 185, 185, 188, 191, 195, ]],
                [79925, [2, 3, 4, 5, 5,     5,  6 , 7,  7,  8,  9 , 9,  9,   9,  10,  10,  13, 13, 16, 18, 21, 24, 26, 26, 27,  30,  31,  31,  32,  33,  36,  37,  40,  40,  42,  43,  44,  52,  53,  53,  55,  55,  58,  62,  69,  71,  74,  77,  78,  76,  79,  86,  88,  92,  93,  93,  93,  94,  119, 122, 124, 127, 132, 132, 132, 144, 147, 153, 154, 187, 208, 213, 215, 216, 221, 224, 228, ]],
                [79927, [3, 3, 5, 7, 8,     8,  8 , 10, 11, 12, 13, 15, 16,  16, 18,  18,  20, 20, 20, 20, 20, 24, 26, 27, 30,  39,  40,  43,  44,  47,  49,  52,  53,  53,  55,  61,  62,  69,  73,  74,  75,  77,  80,  84,  88,  91,  97,  98,  99,  102, 108, 111, 118, 121, 129, 135, 137, 140, 150, 153, 159, 165, 165, 172, 172, 183, 184, 207, 214, 216, 217, 217, 225, 226, 235, 239, 243, ]],
                [79928, [8, 11, 11, 11, 13, 13, 14, 16, 18, 21, 22, 23, 25,  25, 28,  32,  36, 37, 39, 43, 44, 45, 47, 50, 52,  55,  57,  56,  59,  60,  64,  65,  66,  67,  68,  75,  77,  81,  89,  92,  93,  94,  100, 105, 119, 120, 127, 128, 130, 133, 145, 154, 163, 171, 180, 183, 186, 195, 201, 207, 207, 213, 216, 219, 224, 241, 244, 249, 250, 252, 259, 264, 268, 272, 284, 288, 295, ]],
                [79930, [                               2,  2,  2 , 2,  3,   3,  4,   7,   8,  10, 12, 14, 14, 15, 18, 18, 19,  21,  22,  22,  22,  22,  27,  27,  27,  28,  28,  32,  32,  32,  36,  39,  40,  41,  43,  45,  54,  54,  55,  55,  56,  56,  58,  61,  63,  65,  65,  66,  66,  68,  71,  72,  72,  77,  77,  78,  78,  81,  82,  85,  88,  91,  95,  100, 101, 103, 107, 107, 111, ]],
                [79932, [1, 2, 2, 6, 6,     7,  7 , 7,  7,  9,  11, 11, 11,  11, 15,  16,  19, 20, 20, 20, 20, 21, 25, 25, 27,  29,  29,  30,  31,  33,  35,  36,  38,  38,  38,  46,  47,  51,  54,  55,  56,  57,  57,  57,  61,  62,  63,  65,  67,  70,  70,  74,  76,  79,  79,  79,  79,  80,  81,  81,  82,  84,  86,  90,  90,  93,  93,  96,  96,  97,  97,  99,  100, 103, 105, 106, 107, ]],
                [79934, [2, 3, 3, 3, 3,     4,  5 , 10, 12, 14, 14, 15, 16,  16, 17,  18,  20, 22, 22, 22, 22, 25, 26, 26, 26,  26,  26,  26,  26,  26,  27,  28,  28,  28,  28,  28,  29,  30,  31,  32,  32,  32,  32,  33,  36,  36,  37,  37,  37,  38,  38,  40,  41,  41,  43,  46,  46,  46,  47,  47,  48,  48,  48,  48,  48,  51,  52,  53,  54,  54,  54,  56,  57,  57,  60,  60,  62,  ]],
                [79935, [2, 3, 3, 4, 4,     4,  5 , 9,  10, 11, 11, 12, 13,  13, 14,  16,  14, 15, 17, 18, 18, 20, 20, 20, 23,  25,  25,  26,  26,  26,  26,  26,  26,  26,  26,  25,  25,  31,  31,  31,  31,  31,  32,  32,  33,  34,  36,  39,  40,  40,  40,  41,  42,  42,  42,  42,  42,  42,  45,  45,  47,  48,  48,  49,  49,  51,  51,  52,  52,  52,  54,  55,  56,  57,  59,  60,  63,  ]],
                [79936, [5, 7, 9, 13, 16,   19, 20, 23, 27, 30, 38, 42, 48,  49, 57,  66,  72, 77, 84, 85, 86, 91, 96, 98, 101, 115, 117, 121, 124, 129, 135, 138, 140, 141, 149, 144, 150, 156, 164, 170, 172, 172, 179, 182, 197, 200, 205, 215, 219, 228, 236, 252, 255, 260, 273, 273, 276, 281, 288, 294, 298, 306, 307, 310, 316, 334, 342, 351, 357, 363, 370, 379, 387, 392, 411, 417, 423, ]],
                [79938, [5, 8, 10, 12, 12,  15, 17, 20, 24, 28, 35, 32, 36,  38, 45,  48,  59, 71, 74, 75, 76, 83, 94, 101,102, 110, 116, 120, 124, 127, 130, 140, 146, 151, 157, 161, 164, 173, 184, 189, 193, 193, 202, 204, 218, 224, 233, 236, 239, 244, 255, 269, 277, 289, 294, 301, 303, 312, 320, 324, 368, 373, 374, 380, 383, 437, 532, 529, 531, 533, 536, 548, 556, 562, 568, 569, 583, ]],
                ]

    zip_data_tick_amount = 7

    @links = [ ["epstrong.org - May 21, 2020 – #{@last_updated_on.strftime('%B %e, %Y')}", "http://epstrong.org/results.php"],
               ["City of El Paso Facebook - May 20, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-two-additional-deaths/3037450162961073/"],
               ["City of El Paso Facebook - May 19, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-five-additional-deaths/3034810143225075/"],
               ["City of El Paso Facebook - May 18, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-additional-cases-open-texas-efforts-delayed-one-week/3032758493430240/"],
               ["City of El Paso Facebook - May 17, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-one-additional-death-urges-residents-to-take-precautions/3029618743744215/"],
               ["City of El Paso Facebook - May 16, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-one-additional-death-assisting-regional-community/3026910704015019/"],
               ["City of El Paso Facebook - May 15, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-two-additional-deaths-over-2000-people-tested-in-48-hour-period/3023288814377208/"],
               ["City of El Paso Facebook - May 14, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-two-additional-deaths-testing-availability-extended/3020874404618649/"],
               ["City of El Paso Facebook - May 13, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-city-reports-five-additional-deaths/3017487421624014/"],
               ["City of El Paso Facebook - May 12, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-three-additional-deaths/3015394595166630/"],
               ["City of El Paso Facebook - May 11, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/covid-19-update-council-extends-emergency-ordinances/3012964052076351/"],
               ["City of El Paso Facebook - May 10, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-one-covid-19-death-urges-residents-to-protect-vulnerable-population/3010518662320890/"],
               ["City of El Paso Facebook - May 9, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-urges-residents-to-celebrate-mothers-day-virtually/3008140949225328/"],
               ["City of El Paso Facebook - May 8, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-two-additional-deaths-another-spike-in-positive-cases/3005807076125382/"],
               ["City of El Paso Facebook - May 7, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-council-to-amend-local-directive-reports-seven-deaths/3003177806388309/"],
               ["City of El Paso Facebook - May 6, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/city-reports-one-covid-19-death-urges-residents-to-protect-vulnerable-population/3001071953265561/"],
               ["City of El Paso Facebook - May 5, 2020", "https://www.facebook.com/notes/city-of-el-paso-texas-municipal-government/case-numbers-continue-increasing-residents-urged-to-wear-face-coverings/2998656446840445/"],
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
    
    zip_data_max_value = @total_cases_by_zip_code.map { |entry| entry[2] }.max
    
    ##### Globals

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.chart(style: { fontFamily: '\'Inter\', sans-serif'})
      f.lang(thousandsSep: ",")
      f.colors(["#fed907", "#f70000", "#8085e9", "#f15c80", "#e4d354"])
      f.plotOptions( line: { marker: false }, area: { marker: false } )
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
      f.chart({defaultSeriesType: "line"})
      f.plotOptions( area: { marker: false } )
    end

    @total_cases_by_day_logarithmic = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories)
      f.series(name: "Total Cases", data: total_cases_by_day_data)
      f.series(name: "Total Recoveries", data: total_recoveries_by_day_data)

      f.yAxis [
        { type: 'logarithmic', title: { enabled: false }, allowDecimals: false, tickPositions: [1, 10, 100, 1000, 10000].map { |v| Math.log10(v) } },
      ]

      f.colors(["#fed907", "#26dc4e"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "line"})
      f.plotOptions( area: { marker: false } )
    end

    ##### New Cases by Day
    
    new_cases_by_day_data = []

    for i in (1..total_cases_by_day_data.size - 1)
      new_cases_by_day_data += [total_cases_by_day_data[i] - total_cases_by_day_data[i - 1]]
    end

    new_cases_by_day_average_data = []

    for i in (6..new_cases_by_day_data.size - 1)
      new_cases_by_day_average_data += [new_cases_by_day_data.sma(i,7).round(1)]
    end

    @new_cases_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories.drop(1))
      f.series(name: "New Cases", data: new_cases_by_day_data)
      f.series(name: "7-Day Average", data: new_cases_by_day_average_data.pad!((new_cases_by_day_average_data.size + 6) * -1,nil), type: "line")

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: new_cases_by_day_max, tickAmount: new_cases_by_day_tick_amount },
      ]

      f.colors(["#fed907", "#aaaaaa"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    ##### New Recoveries by Day
    
    new_recoveries_by_day_data = []

    for i in (1..total_recoveries_by_day_data.size - 1)
      if !total_recoveries_by_day_data[i].nil? && !total_recoveries_by_day_data[i - 1].nil?
        new_recoveries_by_day_data += [total_recoveries_by_day_data[i] - total_recoveries_by_day_data[i - 1]]
      end
    end

    new_recoveries_by_day_average_data = []

    for i in (6..new_recoveries_by_day_data.size - 1)
      new_recoveries_by_day_average_data += [new_recoveries_by_day_data.sma(i,7).round(1)]
    end

    @new_recoveries_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_day_categories.last(new_recoveries_by_day_data.size))
      f.series(name: "New Recoveries", data: new_recoveries_by_day_data)
      f.series(name: "7-Day Average", data: new_recoveries_by_day_average_data.pad!((new_recoveries_by_day_average_data.size + 6) * -1,nil), type: "line")

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: new_cases_by_day_max, tickAmount: new_cases_by_day_tick_amount },
      ]

      f.colors(["#26dc4e", "#aaaaaa"])
      # f.legend(enabled: false)
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
      f.chart({defaultSeriesType: "line", height: 350})
    end

    @total_deaths_by_day_logarithmic = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_deaths_by_day_categories)
      f.series(name: "Total Deaths", data: total_deaths_by_day_data)

      f.yAxis [
        { type: 'logarithmic', title: { enabled: false }, allowDecimals: false, tickPositions: [1, 10, 100].map { |v| Math.log10(v) } },
      ]

      f.colors(["#f70000"])
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "line", height: 350})
    end

    ##### New Deaths by Day
    
    new_deaths_by_day_data = []

    for i in (1..total_deaths_by_day_data.size - 1)
      new_deaths_by_day_data += [total_deaths_by_day_data[i] - total_deaths_by_day_data[i - 1]]
    end

    new_deaths_by_day_average_data = []

    for i in (6..new_deaths_by_day_data.size - 1)
      new_deaths_by_day_average_data += [new_deaths_by_day_data.sma(i,7).round(1)]
    end

    @new_deaths_by_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_deaths_by_day_categories.drop(1))
      f.series(name: "New Deaths", data: new_deaths_by_day_data)
      f.series(name: "7-Day Average", data: new_deaths_by_day_average_data.pad!((new_deaths_by_day_average_data.size + 6) * -1,nil), type: "line")

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false },
      ]

      f.colors(["#f70000", "#aaaaaa"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    ##### Total Cases by Age Range

    @total_cases_by_age_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_age_range_categories)
      f.series(name: "Total Cases", data: total_cases_by_age_range_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: total_cases_by_age_range_max },
      ]

      f.legend(enabled: false)
      f.chart({defaultSeriesType: "bar", height: 350})
    end

    ##### Total Deaths by Age Range

    @total_deaths_by_age_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: total_cases_by_age_range_categories)
      f.series(name: "Total Deaths", data: total_deaths_by_age_range_data)

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: total_deaths_by_age_range_max },
      ]

      f.colors(["#f70000"])
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "bar", height: 350})
    end

    ##### Total Cases by Gender

    @total_cases_by_gender = LazyHighCharts::HighChart.new('graph') do |f|
      # f.xAxis(title: { enabled: false }, categories: ["Male", "Female"])
      f.series(name: "Total Cases", data: [ { name: 'Male', y: total_cases_by_gender_male }, { name: 'Female', y: total_cases_by_gender_female }])

      # f.yAxis [
      #   { title: { enabled: false }, allowDecimals: false },
      # ]
      f.colors(["#999999", "#666666"])
      f.chart({defaultSeriesType: "pie", height: 350})
    end

    ##### Patients in Hospital

    patients_hospitalized_average_data = []

    for i in (6..patients_hospitalized_data.size - 1)
      patients_hospitalized_average_data += [patients_hospitalized_data.sma(i,7).round(1)]
    end
    
    @patients_hospitalized = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: patients_hospitalized_categories)
      f.series(name: "Patients", data: patients_hospitalized_data)
      f.series(name: "7-Day Average", data: patients_hospitalized_average_data.pad!((patients_hospitalized_average_data.size + 6) * -1,nil), type: "line")

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: patients_max_value, tickAmount: patients_tick_amount },
      ]

      f.colors(["#fed907", "#aaaaaa"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 350})
    end

    ##### Patients in ICU
    
    patients_in_icu_average_data = []

    for i in (6..patients_in_icu_data.size - 1)
      patients_in_icu_average_data += [patients_in_icu_data.sma(i,7).round(1)]
    end

    @patients_in_icu = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(title: { enabled: false }, categories: patients_in_icu_categories)
      f.series(name: "Patients", data: patients_in_icu_data)
      f.series(name: "7-Day Average", data: patients_in_icu_average_data.pad!((patients_in_icu_average_data.size + 6) * -1,nil), type: "line")

      f.yAxis [
        { title: { enabled: false }, allowDecimals: false, max: patients_max_value, tickAmount: patients_tick_amount },
      ]

      f.colors(["#fed907", "#aaaaaa"])
      # f.legend(enabled: false)
      f.chart({defaultSeriesType: "column", height: 350})
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
