require 'rails_helper'

RSpec.describe "bibliographies/show", type: :view do
  before(:each) do
    @bibliography = assign(:bibliography, Bibliography.create!(
      :title => "Title",
      :description => "MyText",
      :image => "Image",
      :amazon_afiliate_link => "Amazon Afiliate Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Amazon Afiliate Link/)
  end
end
