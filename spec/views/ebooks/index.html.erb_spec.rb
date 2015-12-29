require 'spec_helper'

describe "ebooks/index" do
  before(:each) do
    assign(:ebooks, [
      stub_model(Ebook,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :value => "9.99"
      ),
      stub_model(Ebook,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :value => "9.99"
      )
    ])
  end

  it "renders a list of ebooks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
