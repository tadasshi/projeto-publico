require 'spec_helper'

describe "metaphors/index" do
  before(:each) do
    assign(:metaphors, [
      stub_model(Metaphor,
        :title => "Title",
        :slug => "Slug",
        :description => "MyText"
      ),
      stub_model(Metaphor,
        :title => "Title",
        :slug => "Slug",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of metaphors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
