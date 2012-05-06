module DistanceHelper
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # If you create class methods for this module put them here.
  end

  def miles_to_kms(miles)
    kms = miles * 1.609344
    kms.round(1)
  end

  def kms_to_miles(kms)
    miles = kms * 0.621371192
    miles.round(1)
  end
  
end