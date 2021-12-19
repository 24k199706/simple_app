class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def create_notification_by(current_user,like)
    notification = current_user.active_notifications.create(
      post_id: id,
      visited_id: user_id,
      action: "like"
    )
  end
  def create_notification_comment_by(current_user,comment)
    notification = current_user.active_notifications.create(
      post_id: id,
      visited_id: user_id,
      action: "comment"
    )
  end
end
