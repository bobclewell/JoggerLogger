module DistanceHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # If you create class methods for this module put them here.
  end

  def miles_to_kms(miles)
    return 0 if miles.nil? || miles == 0
    kms = miles * 1.609344
    kms.round(1)
  end

  def kms_to_miles(kms)
    return 0 if kms.nil? || kms == 0
    miles = kms * 0.621371192
    miles.round(1)
  end

  def distance(user_id)
    user = User.find_by_id(user_id)
    if user.distance_unit == "kms"
      distance = miles_to_kms(miles)
    elsif user.distance_unit == "miles"
      distance = miles
    else
      "ERROR: Unknown distance unit!"
    end
  end

end