module JogsHelper
  
  def current_goal_statement(current_user)
    if current_user.current_goal.present?
      case current_user.current_goal.goal_type
      when "1"
        "Run #{current_user.current_goal.distance(current_user.id)} #{current_user.distance_unit}."
      when "2"
        "Run for #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)}."
      when "3"
        "Run #{current_user.current_goal.distance(current_user.id)} #{current_user.distance_unit} in #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)}."
      when "4"
        "Run at a pace of #{current_user.current_goal.seconds_to_time_humanized(current_user.current_goal.time)} for #{current_user.current_goal.distance(current_user.id)} #{current_user.distance_unit}."
      when "5"
        "Run #{current_user.current_goal.distance(current_user.id).to_i} #{current_user.distance_unit}."
      when "6"
        "Run #{current_user.current_goal.distance(current_user.id).to_i} #{current_user.distance_unit} in #{current_user.current_goal.time} #{current_user.current_goal.time_unit}."
      end
    else
      "<a href='/goals/new' class='btn btn-success'>Create a new goal!</a>".html_safe
    end
  end

  def goal_statement(goal_id_achieved)
    goal = Goal.find(goal_id_achieved)
    # goal = Goal.find(jog.goal_id)
    # debugger
    case goal.goal_type
    when "1"
      "Run #{goal.distance(current_user.id)} #{current_user.distance_unit}."
    when "2"
      "Run for #{goal.seconds_to_time_humanized(goal.time)}."
    when "3"
      "Run #{goal.distance(current_user.id)} #{current_user.distance_unit} in #{goal.seconds_to_time_humanized(goal.time)}."
    when "4"
      "Run at a pace of #{goal.seconds_to_time_humanized(goal.time)} for #{goal.distance(current_user.id)} #{current_user.distance_unit}."
    when "5"
      "Run #{goal.distance(current_user.id).to_i} #{current_user.distance_unit}."
    when "6"
      "Run #{goal.distance(current_user.id).to_i} #{current_user.distance_unit} in #{goal.time} #{goal.time_unit}."
    end
  end

end
