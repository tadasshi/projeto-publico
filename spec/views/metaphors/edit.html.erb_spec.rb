require 'rails_helper'

RSpec.describe "metaphors/edit", type: :view do
  before(:each) do
    @metaphor = assign(:metaphor, Metaphor.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit metaphor form" do
    render

    assert_select "form[action=?][method=?]", metaphor_path(@metaphor), "post" do

      assert_select "input#metaphor_title[name=?]", "metaphor[title]"

      assert_select "textarea#metaphor_description[name=?]", "metaphor[description]"
    end
  end
end
