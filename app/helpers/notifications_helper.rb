module NotificationsHelper
    def notification_form(notification)
        #いいねの時とコメントをしたときの表記を分岐させる
          if notification.action == "like"
            User.find(notification.visitor_id).name+"さんが"+'あなたの投稿'+Post.find(notification.post_id).title+"にいいねをしました"
          else
            User.find(notification.visitor_id).name+"さんが"+'あなたの投稿'+Post.find(notification.post_id).title+"にコメントをしました"
          end
    end
      
  
end