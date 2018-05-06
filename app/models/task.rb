class Task < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  belongs_to :user
  belongs_to :main_category
end
