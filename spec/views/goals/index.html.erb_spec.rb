require 'spec_helper'

describe "goals/index" do
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :name => "Name",
        :goal_type => "Goal Type",
        :time => 1,
        :time_unit => "Time Unit",
        :distance => 1,
        :distance_unit => "Distance Unit",
        :notes => "Notes",
        :user_id => 1
      ),
      stub_model(Goal,
        :name => "Name",
        :goal_type => "Goal Type",
        :time => 1,
        :time_unit => "Time Unit",
        :distance => 1,
        :distance_unit => "Distance Unit",
        :notes => "Notes",
        :user_id => 1
      )
    ])
  end

  # it "renders a list of goals" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Goal Type".to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Time Unit".to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Distance Unit".to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => "Notes".to_s, :count => 2
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  # end
end
