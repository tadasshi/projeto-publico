require 'rails_helper'

RSpec.describe "banners/index", type: :view do
  before(:each) do
    assign(:banners, [
      Banner.create!(
        :name => "Name"
      ),
      Banner.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of banners" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
