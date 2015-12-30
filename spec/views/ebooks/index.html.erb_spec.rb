require 'rails_helper'

RSpec.describe "ebooks/index", type: :view do
  before(:each) do
    assign(:ebooks, [
      Ebook.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :value => "9.99"
      ),
      Ebook.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :value => "9.99"
      )
    ])
  end

  it "renders a list of ebooks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
