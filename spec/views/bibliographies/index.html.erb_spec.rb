require 'rails_helper'

RSpec.describe "bibliographies/index", type: :view do
  before(:each) do
    assign(:bibliographies, [
      Bibliography.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :amazon_afiliate_link => "Amazon Afiliate Link"
      ),
      Bibliography.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :amazon_afiliate_link => "Amazon Afiliate Link"
      )
    ])
  end

  it "renders a list of bibliographies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Amazon Afiliate Link".to_s, :count => 2
  end
end
