require 'spec_helper'

describe "jogs/index" do
  before(:each) do
    assign(:jogs, [
      stub_model(Jog,
        :seconds => 1,
        :miles => 1,
        :notes => "Notes"
      ),
      stub_model(Jog,
        :seconds => 1,
        :miles => 1,
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of jogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
