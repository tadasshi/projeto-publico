require 'rails_helper'

RSpec.describe "bibliographies/edit", type: :view do
  before(:each) do
    @bibliography = assign(:bibliography, Bibliography.create!(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :amazon_afiliate_link => "MyString"
    ))
  end

  it "renders the edit bibliography form" do
    render

    assert_select "form[action=?][method=?]", bibliography_path(@bibliography), "post" do

      assert_select "input#bibliography_title[name=?]", "bibliography[title]"

      assert_select "textarea#bibliography_description[name=?]", "bibliography[description]"

      assert_select "input#bibliography_image[name=?]", "bibliography[image]"

      assert_select "input#bibliography_amazon_afiliate_link[name=?]", "bibliography[amazon_afiliate_link]"
    end
  end
end
