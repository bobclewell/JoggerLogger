require 'spec_helper'

describe "goals/edit" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :name => "MyString",
      :goal_type => "MyString",
      :time => 1,
      :time_unit => "MyString",
      :distance => 1,
      :distance_unit => "MyString",
      :notes => "MyString",
      :user_id => 1
    ))
  end

  # it "renders the edit goal form" do
  #   render

  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "form", :action => goals_path(@goal), :method => "post" do
  #     assert_select "input#goal_name", :name => "goal[name]"
  #     assert_select "input#goal_goal_type", :name => "goal[goal_type]"
  #     assert_select "input#goal_time", :name => "goal[time]"
  #     assert_select "input#goal_time_unit", :name => "goal[time_unit]"
  #     assert_select "input#goal_distance", :name => "goal[distance]"
  #     assert_select "input#goal_distance_unit", :name => "goal[distance_unit]"
  #     assert_select "input#goal_notes", :name => "goal[notes]"
  #     assert_select "input#goal_user_id", :name => "goal[user_id]"
  #   end
  # end
end
