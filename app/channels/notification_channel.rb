class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{params[:user_id]}"
  end
end
