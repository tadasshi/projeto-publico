require 'rails_helper'

RSpec.describe "ebooks/edit", type: :view do
  before(:each) do
    @ebook = assign(:ebook, Ebook.create!(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :value => "9.99"
    ))
  end

  it "renders the edit ebook form" do
    render

    assert_select "form[action=?][method=?]", ebook_path(@ebook), "post" do

      assert_select "input#ebook_title[name=?]", "ebook[title]"

      assert_select "textarea#ebook_description[name=?]", "ebook[description]"

      assert_select "input#ebook_image[name=?]", "ebook[image]"

      assert_select "input#ebook_value[name=?]", "ebook[value]"
    end
  end
end
