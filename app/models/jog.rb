class Jog < ActiveRecord::Base
  include TimeHelper

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
