require 'spec_helper'

describe "ebooks/new" do
  before(:each) do
    assign(:ebook, stub_model(Ebook,
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :value => "9.99"
    ).as_new_record)
  end

  it "renders new ebook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ebooks_path, "post" do
      assert_select "input#ebook_title[name=?]", "ebook[title]"
      assert_select "textarea#ebook_description[name=?]", "ebook[description]"
      assert_select "input#ebook_image[name=?]", "ebook[image]"
      assert_select "input#ebook_value[name=?]", "ebook[value]"
    end
  end
end
