class Jog < ActiveRecord::Base
  belongs_to :user
  # TODO: validate jog time is in mm:ss OR hh:mm:ss format

  scope :deleted, where('deleted_at IS NOT NULL')
  scope :exists, where('deleted_at IS NULL')

  def self.current_users_total_miles(current_user)
    jogs = Jog.find_all_by_user_id(current_user)
    total_miles = 0
    jogs.each do |jog|
      total_miles += jog.miles if jog.deleted_at.nil?
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
    self.seconds = time_in_seconds
  end

  def seconds_to_time(seconds)
    hours = seconds / 3600
    minutes = (seconds / 60) - (hours * 60)
    actual_seconds = seconds%60
    if hours > 0
      "#{hours}:#{minutes}:#{actual_seconds}"
    else
      "#{minutes}:#{actual_seconds}"
    end
  end

  def display_time
    seconds_to_time(self.seconds) unless self.seconds.nil?
  end

  def display_time=(time_string)
    self.seconds = time_to_seconds(time_string)
    self.save
  end

  def jogged_at_string
    jogged_at.strftime('%-m/%-d/%Y') unless jogged_at.nil?
  end

  def jogged_at_string=(jogged_at_str)
    self.jogged_at = Date.strptime jogged_at_str, '%m/%d/%Y' unless jogged_at_str.nil?
    self.save
  end

  def logically_delete
    self.deleted_at = Time.now
    self.save
  end
end
