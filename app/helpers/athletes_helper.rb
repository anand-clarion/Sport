module AthletesHelper
  def td_color_depend_on_city(city)
    if city == "khajuraho"
      "red"
    elsif city == "satna"
      "grey"
    else
      "Lavender"
    end
  end
end
