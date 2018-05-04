require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :first_name => "First Name",
      :last_name => "Last Name",
      :image_data => "MyText",
      :phone => "Phone",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :postcode => "Postcode",
      :country_code => "Country Code",
      :latitude => 2.5,
      :longitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
