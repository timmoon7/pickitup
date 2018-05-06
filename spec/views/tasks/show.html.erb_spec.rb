require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :user => nil,
      :main_category => nil,
      :title => "Title",
      :body => "MyText",
      :delivery_address => "Delivery Address",
      :pickup_address => "Pickup Address",
      :price => 2,
      :status => "Status",
      :driver_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Delivery Address/)
    expect(rendered).to match(/Pickup Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/3/)
  end
end
