module JogsHelper
  def goal_statement(current_user)
    case current_user.current_goal.goal_type
    when "1"
      "Run #{current_user.current_goal.distance} #{current_user.distance_unit}."
    when "2"
      "Run for #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)}."
    when "3"
      true if current_user.current_goal.single_distance_in_time_achieved?(self, current_user)
    when "4"
      true if current_user.current_goal.single_distance_at_pace_achieved?(self, current_user)
    when "5"
      true if current_user.current_goal.multi_distance_achieved?(current_user)
    when "6"
      true if current_user.current_goal.multi_distance_in_time_achieved?(current_user)
    end
  end
end
