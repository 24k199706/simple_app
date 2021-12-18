module NotificationsHelper
    def notification_form(notification)
        #notification.actionがfollowかlikeかcommentか
        case notification.action
          when "like" then
            tag.a(notification.visited.name, href:user_show_path(visited.id), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:posts_show_path(notification.post_id), style:"font-weight: bold;")+"にいいねしました"
        end
      end
  
end
