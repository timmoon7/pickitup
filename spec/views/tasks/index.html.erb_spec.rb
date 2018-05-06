require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :user => nil,
        :main_category => nil,
        :title => "Title",
        :body => "MyText",
        :delivery_address => "Delivery Address",
        :pickup_address => "Pickup Address",
        :price => 2,
        :status => "Status",
        :driver_id => 3
      ),
      Task.create!(
        :user => nil,
        :main_category => nil,
        :title => "Title",
        :body => "MyText",
        :delivery_address => "Delivery Address",
        :pickup_address => "Pickup Address",
        :price => 2,
        :status => "Status",
        :driver_id => 3
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Address".to_s, :count => 2
    assert_select "tr>td", :text => "Pickup Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
