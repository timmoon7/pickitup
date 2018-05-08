class Task < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :driver, class_name: 'User'
  belongs_to :user
  belongs_to :main_category


    
  # def self.search_by_name(search)
  #   where("LOWER(name) LIKE ?", "%#{search.downcase}%")
  # end

  def price_in_dollars
    price.to_f / 100.0
  end

end
