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

  # checking whether the user is watching the task or not (if yes, it will return true, otherwiese false)
  def watched?(userid, taskid)
    cnt = Watchlist.where(user_id: userid).where(task_id: taskid).count
    if cnt > 0
      true
    else
      false
    end
  end

end
