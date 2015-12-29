require 'spec_helper'

describe "ebooks/show" do
  before(:each) do
    @ebook = assign(:ebook, stub_model(Ebook,
      :title => "Title",
      :description => "MyText",
      :image => "Image",
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/9.99/)
  end
end
