require 'rails_helper'

RSpec.describe "banners/new", type: :view do
  before(:each) do
    assign(:banner, Banner.new(
      :name => "MyString"
    ))
  end

  it "renders new banner form" do
    render

    assert_select "form[action=?][method=?]", banners_path, "post" do

      assert_select "input#banner_name[name=?]", "banner[name]"
    end
  end
end
