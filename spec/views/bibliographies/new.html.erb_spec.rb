require 'rails_helper'

RSpec.describe "bibliographies/new", type: :view do
  before(:each) do
    assign(:bibliography, Bibliography.new(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :amazon_afiliate_link => "MyString"
    ))
  end

  it "renders new bibliography form" do
    render

    assert_select "form[action=?][method=?]", bibliographies_path, "post" do

      assert_select "input#bibliography_title[name=?]", "bibliography[title]"

      assert_select "textarea#bibliography_description[name=?]", "bibliography[description]"

      assert_select "input#bibliography_image[name=?]", "bibliography[image]"

      assert_select "input#bibliography_amazon_afiliate_link[name=?]", "bibliography[amazon_afiliate_link]"
    end
  end
end
