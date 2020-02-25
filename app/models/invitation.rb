class Invitation < ApplicationRecord
  belongs_to :sender,   class_name: "User"
  belongs_to :receiver, class_name: "User"

  # validates :status, length: { maximum: 100  }
end
