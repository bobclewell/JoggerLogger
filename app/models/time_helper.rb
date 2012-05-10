module TimeHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # If you create class methods for this module put them here.
  end

  def pace
    return 0 if self.miles == 0
    if self.class.name == "Goal" && self.time_unit == "seconds"
      pace = self.time / self.miles unless self.time.blank?
    else
      pace = self.seconds / self.miles unless self.seconds.blank?
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
    return "0:00" if seconds.blank?
    hours = seconds / 3600
    if hours < 1
      hours = 0
      minutes = (seconds / 60)
    else 
      minutes = (seconds / 60) - (hours * 60)
    end
    actual_seconds = seconds%60
    formatted_seconds = formatted_time(actual_seconds)
    foratted_minutes = formatted_time(minutes)
    if hours > 0
      "#{hours.to_i}:#{foratted_minutes}:#{formatted_seconds}"
    elsif minutes > 0 && hours < 1
      "#{minutes.to_i}:#{formatted_seconds}"
    elsif minutes < 1
      "0:#{formatted_seconds}"
    end
  end

  # Method that outputs time in more human friendly language.
  # e.g. "1 hour 25 minutes and 30 seconds"
  def seconds_to_time_humanized(seconds)
    return "0 Seconds" if seconds.blank?
    hours = seconds / 3600
    if hours < 1
      hours = 0
      minutes = (seconds / 60)
    else 
      minutes = (seconds / 60) - (hours * 60)
    end
    actual_seconds = seconds%60
    if hours > 0
      "#{hours.to_i} hours #{minutes.to_i} minutes and #{actual_seconds.to_i} seconds"
    elsif minutes > 0 && actual_seconds > 0
      "#{minutes.to_i} minutes and #{actual_seconds.to_i} seconds"
    elsif minutes > 0
      "#{minutes.to_i} minutes"
    else
      "#{actual_seconds.to_i} seconds"
    end
  end

  def formatted_time(seconds_or_minutes)
    if seconds_or_minutes < 10
      formatted_seconds = "0#{seconds_or_minutes.round}"
    else
      formatted_seconds = seconds_or_minutes.round
    end
  end

  def display_time
    seconds_to_time(self.seconds) unless self.seconds.nil?
  end

  def display_time=(time_string)
    self.seconds = time_to_seconds(time_string)
    self.save
  end

  # TODO: Find a better way to construct the seconds data from the 3
  # separate drop-downs, which will clean up the below.

  def part_hours
  end

  def part_hours=(p_hours)
  end

  def part_minutes
  end

  def part_minutes=(p_minutes)
  end

  def part_seconds
  end

  def part_seconds=(p_seconds)
  end
end