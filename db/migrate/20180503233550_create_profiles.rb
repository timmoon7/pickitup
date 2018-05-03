class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :image_data
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
