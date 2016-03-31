require 'rails_helper'

RSpec.describe "biographies/show", type: :view do
  before(:each) do
    @biography = assign(:biography, Biography.create!(
      :title => "Title",
      :description => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
  end
end
