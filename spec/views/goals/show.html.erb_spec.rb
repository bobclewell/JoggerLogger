require 'spec_helper'

describe "goals/show" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :name => "Name",
      :goal_type => "Goal Type",
      :time => 1,
      :time_unit => "Time Unit",
      :distance => 1,
      :distance_unit => "Distance Unit",
      :notes => "Notes",
      :user_id => 1
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Name/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Goal Type/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Time Unit/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Distance Unit/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Notes/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  # end
end
