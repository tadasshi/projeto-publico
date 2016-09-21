require 'rails_helper'

RSpec.describe "banners/show", type: :view do
  before(:each) do
    @banner = assign(:banner, Banner.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
