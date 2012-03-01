require 'spec_helper'

describe "jogs/new" do
  before(:each) do
    assign(:jog, stub_model(Jog,
      :seconds => 1,
      :miles => 1,
      :notes => "MyString"
    ).as_new_record)
  end

  it "renders new jog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jogs_path, :method => "post" do
      assert_select "input#jog_seconds", :name => "jog[seconds]"
      assert_select "input#jog_miles", :name => "jog[miles]"
      assert_select "input#jog_notes", :name => "jog[notes]"
    end
  end
end
