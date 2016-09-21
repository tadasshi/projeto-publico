require 'rails_helper'

RSpec.describe "banner_pictures/new", type: :view do
  before(:each) do
    assign(:banner_picture, BannerPicture.new(
      :picture => "MyString",
      :banner => nil
    ))
  end

  it "renders new banner_picture form" do
    render

    assert_select "form[action=?][method=?]", banner_pictures_path, "post" do

      assert_select "input#banner_picture_picture[name=?]", "banner_picture[picture]"

      assert_select "input#banner_picture_banner_id[name=?]", "banner_picture[banner_id]"
    end
  end
end
