class Task < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  belongs_to :main_category

    
  # def self.search_by_name(search)
  #   where("LOWER(name) LIKE ?", "%#{search.downcase}%")
  # end

end
