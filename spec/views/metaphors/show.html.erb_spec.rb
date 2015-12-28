require 'spec_helper'

describe "metaphors/show" do
  before(:each) do
    @metaphor = assign(:metaphor, stub_model(Metaphor,
      :title => "Title",
      :slug => "Slug",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Slug/)
    rendered.should match(/MyText/)
  end
end
