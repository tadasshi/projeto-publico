require 'rails_helper'

RSpec.describe "biographies/edit", type: :view do
  before(:each) do
    @biography = assign(:biography, Biography.create!(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit biography form" do
    render

    assert_select "form[action=?][method=?]", biography_path(@biography), "post" do

      assert_select "input#biography_title[name=?]", "biography[title]"

      assert_select "textarea#biography_description[name=?]", "biography[description]"

      assert_select "input#biography_image[name=?]", "biography[image]"
    end
  end
end
