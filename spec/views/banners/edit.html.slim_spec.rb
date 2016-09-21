require 'rails_helper'

RSpec.describe "banners/edit", type: :view do
  before(:each) do
    @banner = assign(:banner, Banner.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit banner form" do
    render

    assert_select "form[action=?][method=?]", banner_path(@banner), "post" do

      assert_select "input#banner_name[name=?]", "banner[name]"
    end
  end
end
