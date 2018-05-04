json.extract! profile, :id, :user_id, :first_name, :last_name, :image_data, :phone, :street_address, :city, :state, :postcode, :country_code, :latitude, :longitude, :created_at, :updated_at
json.url profile_url(profile, format: :json)
