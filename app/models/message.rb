class Message < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, length: { maximum: 100  }


  after_create :broadcast_message

  def broadcast_message

    chat_room_id = self.sender.id * self.receiver.id

    ActionCable.server.broadcast("chat_room_#{chat_room_id}", {
      message: self.content,
      sender: sender.id,
      img: sender.photo.key
    })
  end
end
