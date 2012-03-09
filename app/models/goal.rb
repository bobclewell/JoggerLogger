class Goal < ActiveRecord::Base

  def achieved?
        
  end

  def single_distance_achieved?
  end

  def single_total_time_achieved?
  end

  def single_distance_in_time_achieved?
  end

  def single_distance_at_pace_achieved?
  end

  def multi_distance_achieved?
  end

  def multi_distance_in_time_achieved?
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
