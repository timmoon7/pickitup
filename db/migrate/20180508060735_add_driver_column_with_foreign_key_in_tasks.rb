class AddDriverColumnWithForeignKeyInTasks < ActiveRecord::Migration[5.1]
  def change
    change_table(:tasks) do |t|
      t.references :driver, foreign_key: {to_table: :users}
    end
  end
end
