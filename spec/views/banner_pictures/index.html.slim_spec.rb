require 'rails_helper'

RSpec.describe "banner_pictures/index", type: :view do
  before(:each) do
    assign(:banner_pictures, [
      BannerPicture.create!(
        :picture => "Picture",
        :banner => nil
      ),
      BannerPicture.create!(
        :picture => "Picture",
        :banner => nil
      )
    ])
  end

  it "renders a list of banner_pictures" do
    render
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
