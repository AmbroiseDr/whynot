class User < ApplicationRecord
  attr_accessor :form_tags
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :questions, through: :answers
  belongs_to :profile_mbti
  has_one_attached :photo
end
