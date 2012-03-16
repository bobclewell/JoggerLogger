class Goal < ActiveRecord::Base
  include TimeHelper

  validate :user_can_only_have_one_current_goal

  scope :deleted, where('deleted_at IS NOT NULL')
  scope :exists, where('deleted_at IS NULL')
  scope :current, where('current = true')
 
  def single_distance_achieved?(jog, current_user)
    true if jog.miles >= current_user.current_goal.miles
  end

  def single_total_time_achieved?(jog, current_user)
    true if jog.seconds >= current_user.current_goal.time
  end

  def single_distance_in_time_achieved?
  end

  def single_distance_at_pace_achieved?
  end

  def multi_distance_achieved?
  end

  def multi_distance_in_time_achieved?
  end

  def user_can_only_have_one_current_goal
    users_other_goals = Goal.find_by_user_id(self.user_id)
    if users_other_goals #there is more than one current goal
      errors.add(:current) << "There can only be one current goal for this user."
    end
  end

  def logically_delete
    self.deleted_at = Time.now
    self.save
  end

# == Goal types ==
# -- Single jog goals --
# 1. distance (run a marathon)
# 2. total time (run for an hour)
# 3. distance in a period of time (run a 5k in 28 minutes)
# 4. maintain a pace over a distance (run a 10 miler at a 9 min per mile pace)

# -- Multi run goals --
# 5. Accumulate a distance (run 1000 miles)
# 6. Accumulate a distance over time (run 600 miles this year - ends when the time ends)


end
