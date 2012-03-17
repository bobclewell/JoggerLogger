require 'spec_helper'

describe Jog do
  it { should belong_to :user }

  context "when a single jog distance goal is the current goal" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_distance_10_miles)
    end

    it "should not mark goal achieved when when the jog is shorter than the goal distance." do
      @jog = Jog.create(:miles => 9)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is equal to the goal distance." do
      @jog = Jog.create(:miles => 10)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should mark goal achieved when when the jog is longer than the goal distance." do
      @jog = Jog.create(:miles => 11)
      @jog.goal_achieved_for(@user).should be_true
    end
  end

  context "when a single jog total time goal is the current goal" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_total_time_1_hour)
    end

    it "should not mark goal achieved when when the jog is shorter than the goal time." do
      @jog = Jog.create(:seconds => 3000)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is equal to the goal time." do
      @jog = Jog.create(:seconds => 3600)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should mark goal achieved when when the jog is longer than the goal time." do
      @jog = Jog.create(:seconds => 5500)
      @jog.goal_achieved_for(@user).should be_true
    end
  end

  context "when a single distance in a time goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_6_miles_in_1_hour)
    end

    it "should not get marked achieved if the distance is too short." do
      @jog = Jog.create(:miles => 5.5, :seconds => 3300)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should not get marked achieved if the distance is equal, but the time to too long." do
      @jog = Jog.create(:miles => 6.0, :seconds => 5500)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should not get marked achieved if the distance is greater than, but the time to too long." do
      @jog = Jog.create(:miles => 8.5, :seconds => 5500)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should get marked achieved if the distance is equal, and the time is equal." do
      @jog = Jog.create(:miles => 6.0, :seconds => 3600)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the time is less than the goal." do
      @jog = Jog.create(:miles => 6.4, :seconds => 3333)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the time is equal." do
      @jog = Jog.create(:miles => 6.9, :seconds => 3600)
      @jog.goal_achieved_for(@user).should be_true
    end
  end

  context "when a single distance in a pace goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_3_miles_at_9_minute_pace)
    end

    it "should not get marked achieved if the distance is too short." do
      @jog = Jog.create(:miles => 2.5, :seconds => 1300)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should not get marked achieved if the distance is equal, but the pace is too slow." do
      @jog = Jog.create(:miles => 3.0, :seconds => 1999)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should not get marked achieved if the distance is greater than, but pace is too slow." do
      @jog = Jog.create(:miles => 4.5, :seconds => 2999)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should get marked achieved if the distance is equal, and the pace is equal." do
      @jog = Jog.create(:miles => 3.0, :seconds => 1620)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the pace is faster than the goal." do
      @jog = Jog.create(:miles => 4.0, :seconds => 2000)
      @jog.goal_achieved_for(@user).should be_true
    end

    it "should get marked achieved if the distance is greater than, and the pace is equal." do
      @jog = Jog.create(:miles => 4.0, :seconds => 2160)
      @jog.goal_achieved_for(@user).should be_true
    end
  end

  context "when a multi distance goal is set" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:multi_run_1000_miles)
    end

    it "should not get market achieved if the distance is less than the goal." do
      # A couple really long jogs to get to the goal quickly.
      @jog_1 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_2 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_3 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_3.goal_achieved_for(@user).should_not be_true
    end

    it "should get market achieved if the distance is equal to the goal." do
      # A couple really long jogs to get to the goal quickly.
      @jog_1 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_2 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_3 = Jog.create(:miles => 400.0, :user_id => 1)
      @jog_3.goal_achieved_for(@user).should be_true
    end

    it "should get market achieved if the distance is greater than the goal." do
      # A couple really long jogs to get to the goal quickly.
      @jog_1 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_2 = Jog.create(:miles => 300.0, :user_id => 1)
      @jog_3 = Jog.create(:miles => 401.0, :user_id => 1)
      @jog_3.goal_achieved_for(@user).should be_true
    end
  end
end
