FactoryGirl.define do
  factory :single_distance_10_miles, :class => Goal do
    goal_type "1"
    miles 10
    user_id 1
    current 1
  end

  factory :single_distance_13_miles, :class => Goal do
    goal_type "1"
    miles 13
    user_id 1
    current 1
  end

  # factory :single_distance_goal, :class => Goal do
  #   goal_type
  #   time
  #   time_unit ""
  #   distance "10"
  #   distance_unit "miles"
  #   user_id
  # end
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