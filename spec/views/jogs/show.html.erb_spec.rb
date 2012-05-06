require 'spec_helper'

describe "jogs/show" do
  before(:each) do
    @jog = assign(:jog, stub_model(Jog,
      :seconds => 1,
      :miles => 1,
      :notes => "Notes"
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/1/)
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   rendered.should match(/Notes/)
  # end
end
