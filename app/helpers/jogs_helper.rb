module JogsHelper
  def goal_statement(current_user)
    case current_user.current_goal.goal_type
    when "1"
      "Run #{current_user.current_goal.distance} #{current_user.distance_unit}."
    when "2"
      "Run for #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)}."
    when "3"
      "Run #{current_user.current_goal.distance} #{current_user.distance_unit} in #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)}."
    when "4"
      "Run at a pace of #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)} for #{current_user.current_goal.distance} #{current_user.distance_unit}."
    when "5"
      "Run #{current_user.current_goal.distance.to_i} #{current_user.distance_unit}."
    when "6"
      "Run #{current_user.current_goal.distance.to_i} #{current_user.distance_unit} in #{current_user.current_goal.time} #{current_user.current_goal.time_unit}."
    end
  end
end
