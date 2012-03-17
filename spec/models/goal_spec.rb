require 'spec_helper'

describe Goal do

  context "when one goal already exists for a user" do
    before(:each) do
      @user = Factory(:user)
      @goal_one = Factory(:single_distance_10_miles)
    end

    it "should not save when trying to add a second current goal." do
      new_goal = Goal.create(:name => "New Longer Goal",
                             :goal_type => "1",
                             :current => true,
                             :user_id => 1)
      new_goal.save.should be_false
    end
  end

  context "when a single distance goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_distance_10_miles)
    end

    it "should not get marked achieved if the distance is not run." do
      @jog = Jog.create(:miles => 9)
      @goal.single_distance_achieved?(@jog, @user).should_not be_true
    end

    it "should get marked goal achieved when the distance is run." do
      @jog = Jog.create(:miles => 10)
      @goal.single_distance_achieved?(@jog, @user).should be_true
    end

    it "should get marked goal achieved when a greater distance is run." do
      @jog = Jog.create(:miles => 11)
      @goal.single_distance_achieved?(@jog, @user).should be_true
    end
  end

  context "when a single total time goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_total_time_1_hour)
    end

    it "should not get marked achieved if the time is less than the goal" do
      @jog = Jog.create(:seconds => 3000)
      @goal.single_total_time_achieved?(@jog, @user).should_not be_true
    end

    it "should get marked achieved if the time is equal to the the goal" do
      @jog = Jog.create(:seconds => 3600)
      @goal.single_total_time_achieved?(@jog, @user).should be_true
    end

    it "should get marked achieved if the time is greater than the the goal" do
      @jog = Jog.create(:seconds => 4500)
      @goal.single_total_time_achieved?(@jog, @user).should be_true
    end
  end

  context "when a single distance in a time goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_6_miles_in_1_hour)
    end

    it "should not get marked achieved if the distance is too short." do
      @jog = Jog.create(:miles => 5.5, :seconds => 3300)
      @goal.single_distance_in_time_achieved?(@jog, @user).should_not be_true
    end

    it "should not get marked achieved if the distance is equal, but the time to too long." do
      @jog = Jog.create(:miles => 6.0, :seconds => 5500)
      @goal.single_distance_in_time_achieved?(@jog, @user).should_not be_true
    end

    it "should not get marked achieved if the distance is greater than, but the time to too long." do
      @jog = Jog.create(:miles => 8.5, :seconds => 5500)
      @goal.single_distance_in_time_achieved?(@jog, @user).should_not be_true
    end

    it "should get marked achieved if the distance is equal, and the time is equal." do
      @jog = Jog.create(:miles => 6.0, :seconds => 3600)
      @goal.single_distance_in_time_achieved?(@jog, @user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the time is less than the goal." do
      @jog = Jog.create(:miles => 6.4, :seconds => 3333)
      @goal.single_distance_in_time_achieved?(@jog, @user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the time is equal." do
      @jog = Jog.create(:miles => 6.9, :seconds => 3600)
      @goal.single_distance_in_time_achieved?(@jog, @user).should be_true
    end
  end

  context "when a single distance at a pace goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_3_miles_at_9_minute_pace)
    end

    it "should not get marked achieved if the distance is too short even if the pace is good." do
      @jog = Jog.create(:miles => 2.5, :seconds => 1300)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should_not be_true
    end

    it "should not get marked achieved if the distance is equal, but the pace to too slow." do
      @jog = Jog.create(:miles => 3.0, :seconds => 1999)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should_not be_true
    end

    it "should not get marked achieved if the distance is greater than, but the pace is too slow." do
      @jog = Jog.create(:miles => 4.5, :seconds => 2999)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should_not be_true
    end

    it "should get marked achieved if the distance is equal, and the pace is equal." do
      @jog = Jog.create(:miles => 3.0, :seconds => 1620)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the pace is faster than the goal." do
      @jog = Jog.create(:miles => 4.0, :seconds => 2000)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the pace is equal." do
      @jog = Jog.create(:miles => 4.0, :seconds => 2160)
      @goal.single_distance_at_pace_achieved?(@jog, @user).should be_true
    end
  end

  # def multi_distance_achieved?
  # end

  # def multi_distance_in_time_achieved?
  # end

end
