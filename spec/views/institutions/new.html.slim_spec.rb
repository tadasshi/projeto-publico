require 'rails_helper'

RSpec.describe "institutions/new", type: :view do
  before(:each) do
    assign(:institution, Institution.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :website => "MyString",
      :description => "MyText",
      :website => "MyString"
    ))
  end

  it "renders new institution form" do
    render

    assert_select "form[action=?][method=?]", institutions_path, "post" do

      assert_select "input#institution_name[name=?]", "institution[name]"

      assert_select "input#institution_email[name=?]", "institution[email]"

      assert_select "input#institution_phone[name=?]", "institution[phone]"

      assert_select "input#institution_website[name=?]", "institution[website]"

      assert_select "textarea#institution_description[name=?]", "institution[description]"

      assert_select "input#institution_website[name=?]", "institution[website]"
    end
  end
end
