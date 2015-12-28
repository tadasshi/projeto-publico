require 'spec_helper'

describe "bibliographies/index" do
  before(:each) do
    assign(:bibliographies, [
      stub_model(Bibliography,
        :title => "Title",
        :slug => "Slug",
        :description => "MyText",
        :amazon_afiliate_link => "Amazon Afiliate Link",
        :image => "Image"
      ),
      stub_model(Bibliography,
        :title => "Title",
        :slug => "Slug",
        :description => "MyText",
        :amazon_afiliate_link => "Amazon Afiliate Link",
        :image => "Image"
      )
    ])
  end

  it "renders a list of bibliographies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Amazon Afiliate Link".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
