require 'spec_helper'

describe "bibliographies/new" do
  before(:each) do
    assign(:bibliography, stub_model(Bibliography,
      :title => "MyString",
      :slug => "MyString",
      :description => "MyText",
      :amazon_afiliate_link => "MyString",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new bibliography form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bibliographies_path, "post" do
      assert_select "input#bibliography_title[name=?]", "bibliography[title]"
      assert_select "input#bibliography_slug[name=?]", "bibliography[slug]"
      assert_select "textarea#bibliography_description[name=?]", "bibliography[description]"
      assert_select "input#bibliography_amazon_afiliate_link[name=?]", "bibliography[amazon_afiliate_link]"
      assert_select "input#bibliography_image[name=?]", "bibliography[image]"
    end
  end
end
