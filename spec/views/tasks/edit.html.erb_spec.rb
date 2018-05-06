require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :user => nil,
      :main_category => nil,
      :title => "MyString",
      :body => "MyText",
      :delivery_address => "MyString",
      :pickup_address => "MyString",
      :price => 1,
      :status => "MyString",
      :driver_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[main_category_id]"

      assert_select "input[name=?]", "task[title]"

      assert_select "textarea[name=?]", "task[body]"

      assert_select "input[name=?]", "task[delivery_address]"

      assert_select "input[name=?]", "task[pickup_address]"

      assert_select "input[name=?]", "task[price]"

      assert_select "input[name=?]", "task[status]"

      assert_select "input[name=?]", "task[driver_id]"
    end
  end
end
