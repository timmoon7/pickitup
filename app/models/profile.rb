class Profile < ApplicationRecord
  belongs_to :user

  validates(
    :first_name, 
    :last_name, 
    :street_address, 
    :city, 
    :postcode, 
    :state, 
    :country_code, 
    presence: true)

  geocoded_by :full_address
  after_validation :geocode
    
  def full_address
    "#{street_address}, #{city}, #{state}, #{postcode}, #{country_code}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
