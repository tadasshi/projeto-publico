require 'rails_helper'

RSpec.describe "institutions/index", type: :view do
  before(:each) do
    assign(:institutions, [
      Institution.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :website => "Website",
        :description => "MyText",
        :website => "Website"
      ),
      Institution.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :website => "Website",
        :description => "MyText",
        :website => "Website"
      )
    ])
  end

  it "renders a list of institutions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
