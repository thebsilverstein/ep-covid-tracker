module DashboardHelper

  def yesterday(value)
    if value == 0
      return "No change since yesterday"
    end
    str = ""
    str += "#{number_with_delimiter(value.abs)}"
    str += " more than yesterday" if value > 0
    str += " less than yesterday" if value < 0
    str
  end

end
