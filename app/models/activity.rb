class Activity < ActiveRecord::Base
  belongs_to :user

  scope :recent, ->{order "created_at DESC"}
  scope :activities_by_user_ids, ->user_ids{where "user_id IN (?)", user_ids}
  scope :daily_report, ->finish_task{where "date(created_at) = date(\"now\") 
    and activity_type = ?", finish_task}
end
