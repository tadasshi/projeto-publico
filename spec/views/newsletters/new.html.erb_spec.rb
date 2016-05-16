require 'rails_helper'

RSpec.describe "newsletters/new", type: :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "input#newsletter_name[name=?]", "newsletter[name]"

      assert_select "input#newsletter_email[name=?]", "newsletter[email]"
    end
  end
end
