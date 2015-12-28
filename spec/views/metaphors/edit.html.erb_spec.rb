require 'spec_helper'

describe "metaphors/edit" do
  before(:each) do
    @metaphor = assign(:metaphor, stub_model(Metaphor,
      :title => "MyString",
      :slug => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit metaphor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metaphor_path(@metaphor), "post" do
      assert_select "input#metaphor_title[name=?]", "metaphor[title]"
      assert_select "input#metaphor_slug[name=?]", "metaphor[slug]"
      assert_select "textarea#metaphor_description[name=?]", "metaphor[description]"
    end
  end
end
