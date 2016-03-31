require 'rails_helper'

RSpec.describe "biographies/new", type: :view do
  before(:each) do
    assign(:biography, Biography.new(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders new biography form" do
    render

    assert_select "form[action=?][method=?]", biographies_path, "post" do

      assert_select "input#biography_title[name=?]", "biography[title]"

      assert_select "textarea#biography_description[name=?]", "biography[description]"

      assert_select "input#biography_image[name=?]", "biography[image]"
    end
  end
end
