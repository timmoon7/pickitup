class CreateSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_categories do |t|
      t.references :main_category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
