class AddImageDataToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :image_data, :text
  end
end
