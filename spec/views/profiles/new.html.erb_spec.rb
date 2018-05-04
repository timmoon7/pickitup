require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :image_data => "MyText",
      :phone => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postcode => "MyString",
      :country_code => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "textarea[name=?]", "profile[image_data]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "input[name=?]", "profile[street_address]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[state]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "input[name=?]", "profile[country_code]"

      assert_select "input[name=?]", "profile[latitude]"

      assert_select "input[name=?]", "profile[longitude]"
    end
  end
end
