class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :location, :distance_unit

  has_many :jogs
  has_many :goals

  DISTANCE_UNIT = %w[ miles kms ]

  def current_goal
    current_goal = Goal.find_all_by_user_id_and_current(self.id, true)
    current_goal.first
  end

  def total_miles
    jogs = Jog.exists.where("user_id = ?", self.id)
    total_miles = 0
    jogs.each do |jog|
      total_miles += jog.miles
    end
    total_miles
  end

  def total_miles_since(start_date)
    jogs = Jog.exists.where("user_id = ? AND created_at >= ?", self.id, start_date)
    total_miles = 0
    jogs.each do |jog|
      total_miles += jog.miles
    end
    total_miles
  end

end
