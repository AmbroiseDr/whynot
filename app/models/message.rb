class Message < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, length: { maximum: 100  }


  after_create :broadcast_message
  after_create :broadcast_notification

  def broadcast_message
    chat_room_id = self.sender.id * self.receiver.id

    if self.sender.photo.attached?
      ActionCable.server.broadcast("chat_room_#{chat_room_id}", {
        message: self.content,
        sender: sender.id,
        img: sender.photo.key
      })
    else
      ActionCable.server.broadcast("chat_room_#{chat_room_id}", {
        message: self.content,
        sender: sender.id,
      })
    end
  end

  def broadcast_notification

    receiver_id = self.receiver.id
    ActionCable.server.broadcast("notification_#{receiver_id}", {
        sender_id: self.sender.id
    })
  end

end
