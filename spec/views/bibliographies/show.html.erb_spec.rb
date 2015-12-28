require 'spec_helper'

describe "bibliographies/show" do
  before(:each) do
    @bibliography = assign(:bibliography, stub_model(Bibliography,
      :title => "Title",
      :slug => "Slug",
      :description => "MyText",
      :amazon_afiliate_link => "Amazon Afiliate Link",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Slug/)
    rendered.should match(/MyText/)
    rendered.should match(/Amazon Afiliate Link/)
    rendered.should match(/Image/)
  end
end
