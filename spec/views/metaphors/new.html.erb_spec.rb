require 'rails_helper'

RSpec.describe "metaphors/new", type: :view do
  before(:each) do
    assign(:metaphor, Metaphor.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new metaphor form" do
    render

    assert_select "form[action=?][method=?]", metaphors_path, "post" do

      assert_select "input#metaphor_title[name=?]", "metaphor[title]"

      assert_select "textarea#metaphor_description[name=?]", "metaphor[description]"
    end
  end
end
