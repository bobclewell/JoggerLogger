class Jog < ActiveRecord::Base
  belongs_to :user
  # TODO: validate jog time is in mm:ss OR hh:mm:ss format

  def self.current_users_total_miles(current_user)
    jogs = Jog.find_all_by_user_id(current_user)
    total_miles = 0
    jogs.each do |jog|
      total_miles += jog.miles
    end
    total_miles
  end

  def time_to_seconds(time_string)
    time_string = time_string.split(':')
    if time_string.length == 3
      hours = time_string[0].to_i
      minutes = time_string[1].to_i
      seconds = time_string[2].to_i
      time_in_seconds = hours * 3600 + minutes * 60 + seconds
    elsif time_string.length == 2
      minutes = time_string[0].to_i
      seconds = time_string[1].to_i
      time_in_seconds = minutes * 60 + seconds
    elsif time_string.length == 1
      time_in_seconds = time_string[0].to_i
    end
  end

  def seconds_to_time(seconds)
  end
end
