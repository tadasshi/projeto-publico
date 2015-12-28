require 'spec_helper'

describe "bibliographies/edit" do
  before(:each) do
    @bibliography = assign(:bibliography, stub_model(Bibliography,
      :title => "MyString",
      :slug => "MyString",
      :description => "MyText",
      :amazon_afiliate_link => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit bibliography form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bibliography_path(@bibliography), "post" do
      assert_select "input#bibliography_title[name=?]", "bibliography[title]"
      assert_select "input#bibliography_slug[name=?]", "bibliography[slug]"
      assert_select "textarea#bibliography_description[name=?]", "bibliography[description]"
      assert_select "input#bibliography_amazon_afiliate_link[name=?]", "bibliography[amazon_afiliate_link]"
      assert_select "input#bibliography_image[name=?]", "bibliography[image]"
    end
  end
end
