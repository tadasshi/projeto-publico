require 'rails_helper'

RSpec.describe "banner_pictures/edit", type: :view do
  before(:each) do
    @banner_picture = assign(:banner_picture, BannerPicture.create!(
      :picture => "MyString",
      :banner => nil
    ))
  end

  it "renders the edit banner_picture form" do
    render

    assert_select "form[action=?][method=?]", banner_picture_path(@banner_picture), "post" do

      assert_select "input#banner_picture_picture[name=?]", "banner_picture[picture]"

      assert_select "input#banner_picture_banner_id[name=?]", "banner_picture[banner_id]"
    end
  end
end
