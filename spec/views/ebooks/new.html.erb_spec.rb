require 'rails_helper'

RSpec.describe "ebooks/new", type: :view do
  before(:each) do
    assign(:ebook, Ebook.new(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :value => "9.99"
    ))
  end

  it "renders new ebook form" do
    render

    assert_select "form[action=?][method=?]", ebooks_path, "post" do

      assert_select "input#ebook_title[name=?]", "ebook[title]"

      assert_select "textarea#ebook_description[name=?]", "ebook[description]"

      assert_select "input#ebook_image[name=?]", "ebook[image]"

      assert_select "input#ebook_value[name=?]", "ebook[value]"
    end
  end
end
