module DashboardHelper

  def yesterday(value, reverse = false, short = false)
    if value == 0
      return (short == false ? "No change compared to yesterday" : 0)
    end
    str = ""
    str += "<i class='fas fa-caret-up fa-#{reverse == false ? 'bad' : 'good'}'></i> +" if value > 0
    str += "<i class='fas fa-caret-down fa-#{reverse == false ? 'good' : 'bad'}'></i> " if value < 0
    str += "#{number_with_delimiter(value)}"
    str += " compared to yesterday" if short == false
    str.html_safe
  end

end
