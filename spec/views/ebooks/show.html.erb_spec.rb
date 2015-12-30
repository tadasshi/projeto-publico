require 'rails_helper'

RSpec.describe "ebooks/show", type: :view do
  before(:each) do
    @ebook = assign(:ebook, Ebook.create!(
      :title => "Title",
      :description => "MyText",
      :image => "Image",
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/9.99/)
  end
end
