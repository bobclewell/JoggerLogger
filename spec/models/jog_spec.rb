require 'spec_helper'

describe Jog do
  it { should belong_to :user }

  context "when a single jog distance goal is the current goal" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_distance_10_miles)
    end

    it "should not mark goal achieved when when the jog is longer than the goal distance." do
      @jog = Jog.create(:miles => 9)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is equal to the goal distance." do
      @jog = Jog.create(:miles => 10)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is longer than the goal distance." do
      @jog = Jog.create(:miles => 11)
      @jog.goal_achieved_for(@user).should_not be_true
    end
  end

  context "when a single jog total time goal is the current goal" do
    before(:each) do
      @user = Factory(:user)
      @goal = Factory(:single_total_time_1_hour)
    end

    it "should not mark goal achieved when when the jog is longer than the goal distance." do
      @jog = Jog.create(:seconds => 3000)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is equal to the goal distance." do
      @jog = Jog.create(:seconds => 3600)
      @jog.goal_achieved_for(@user).should_not be_true
    end

    it "should mark goal achieved when when the jog is longer than the goal distance." do
      @jog = Jog.create(:seconds => 5500)
      @jog.goal_achieved_for(@user).should_not be_true
    end
  end
end
