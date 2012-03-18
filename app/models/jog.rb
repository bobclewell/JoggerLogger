class Jog < ActiveRecord::Base
  include TimeHelper

  belongs_to :user
  # TODO: validate jog time is in mm:ss OR hh:mm:ss format

  scope :deleted, where('deleted_at IS NOT NULL')
  scope :exists, where('deleted_at IS NULL')

  def goal_achieved_for(current_user)
    case current_user.current_goal.goal_type
    when "1"
      true if current_user.current_goal.single_distance_achieved?(self, current_user)
    when "2"
      true if current_user.current_goal.single_total_time_achieved?(self, current_user)
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

  # When a new jog is created we check the goal status.
  # If it is achieved we flag the goal with the achieved at datetime,
  # and mark this jogs as a jog that achieved a goal
  # along with the goal_id that it achieved.
  def check_goal_status_for(current_user)
    if self.goal_achieved_for(current_user)
      
      self.update_attributes(:goal_achieved => true,
                             :goal_id_achieved => current_user.current_goal.id)
      
      current_user.current_goal.update_attributes(:achieved_at => Time.now,
                                                  :current => false)

    end
  end

  def jogged_at_string
    jogged_at.strftime('%-m/%-d/%Y') unless jogged_at.nil?
  end

  def jogged_at_string=(jogged_at_str)
    self.jogged_at = Date.strptime jogged_at_str, '%m/%d/%Y' unless jogged_at_str.nil?
  end

  def logically_delete
    self.deleted_at = Time.now
    self.save
  end
end
