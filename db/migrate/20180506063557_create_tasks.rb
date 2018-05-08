class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :main_category, foreign_key: true
      t.string :title
      t.text :body
      t.string :delivery_address
      t.string :pickup_address
      t.integer :price
      t.timestamp :pickup_time
      t.string :status
      t.integer :driver, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
