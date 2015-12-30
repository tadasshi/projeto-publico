require 'rails_helper'

RSpec.describe "metaphors/index", type: :view do
  before(:each) do
    assign(:metaphors, [
      Metaphor.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Metaphor.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of metaphors" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
