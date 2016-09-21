require 'rails_helper'

RSpec.describe "banner_pictures/show", type: :view do
  before(:each) do
    @banner_picture = assign(:banner_picture, BannerPicture.create!(
      :picture => "Picture",
      :banner => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Picture/)
    expect(rendered).to match(//)
  end
end
