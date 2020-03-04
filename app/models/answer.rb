class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :value, presence: true
end
