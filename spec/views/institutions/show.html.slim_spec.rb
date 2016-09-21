require 'rails_helper'

RSpec.describe "institutions/show", type: :view do
  before(:each) do
    @institution = assign(:institution, Institution.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :website => "Website",
      :description => "MyText",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Website/)
  end
end
