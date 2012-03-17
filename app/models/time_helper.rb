module TimeHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # If you get some class methods put them here.
  end

  def pace
    if self.class.name == "Goal" && self.time_unit == "seconds"
      pace = self.time / self.miles
    else
      pace = self.seconds / self.miles
    end
    pace = seconds_to_time(pace)
  end

  def pace_in_seconds
    if self.class.name == "Goal" && self.time_unit == "seconds"
      pace = self.time / self.miles
    else
      pace = self.seconds / self.miles
    end
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
    self.seconds = time_in_seconds
  end

  def seconds_to_time(seconds)
    hours = seconds / 3600
    if hours < 1
      hours = 0
      minutes = (seconds / 60)
    else 
      minutes = (seconds / 60) - (hours * 60)
    end
    actual_seconds = seconds%60
    actual_seconds = "0#{actual_seconds}" if actual_seconds < 10
    if hours > 0
      "#{hours.to_i}:#{minutes.to_i}:#{actual_seconds.to_i}"
    else
      "#{minutes.to_i}:#{actual_seconds.to_i}"
    end
  end

  def display_time
    seconds_to_time(self.seconds) unless self.seconds.nil?
  end

  def display_time=(time_string)
    self.seconds = time_to_seconds(time_string)
    self.save
  end
end