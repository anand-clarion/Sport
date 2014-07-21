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

  def user_already_liked(athlete, current_athlete)
    @likable = Athlete.find(athlete)
    if Like.where(likable_id: @likable.id , likable_type: @likable.class , user: current_athlete).exists?
      "liked"
    else
      "like"
    end
  end

end
