require 'rails_helper'

RSpec.describe "metaphors/show", type: :view do
  before(:each) do
    @metaphor = assign(:metaphor, Metaphor.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
