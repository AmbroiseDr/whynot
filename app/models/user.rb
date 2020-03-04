class User < ApplicationRecord

  ACTIVITIES = [
    'sport',
    'cooking',
    'museum',
    'music',
    'walk',
    'cofee',
    'game',
    'escapes'
  ]

  FRENCH_ACTIVITIES = {
    'sport'   => 'Sport',
    'cooking' => 'Cours de cuisine',
    'museum'  => 'Exposition',
    'music'   => 'Concert',
    'walk'    =>  'Promenade',
    'cofee'   => 'Café',
    'game'    => 'Bar à jeux',
    'escape'  => 'Escape game',

  }

  ICONS = {
    'sport'   => 'fa-football-ball',
    'cooking' => 'fa-utensils',
    'museum'  => 'fa-paint-brush',
    'music'   => 'fa-music',
    'walk'    =>  'fa-tree',
    'cofee'   => 'fa-coffee',
    'game'    => 'fa-chess-knight',
    'escape'  => 'fa-search',
  }

  attr_accessor :form_tag_list
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :questions, through: :answers
  belongs_to :profile_mbti
  has_one_attached :photo
  validates :photo, presence: true

  MATCHING_MBTI = {
    "INFP" => {85 => ["ENFJ","ENTJ"],
               70 => ["INFP","ENFP","INFJ","INTJ","INTP","ENTP"],
               15 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
              },
    "ENFP" => {85 => ["INFJ", "INTJ"],
               70 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
               15 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "INFJ" => {85 => ["ENFP","ENTP"],
               70 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
               15 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ENFJ" => {85 => ["INFP","ISFP"],
               70 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","INTP","ENTP"],
               15 => ["ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "INTJ" => {85 => ["ENFP","ENTP"],
               70 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
               55 => ["ISFP", "ESFP", "ISTP","ESTP"],
               30 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ENTJ" => {85 => ["INFP","INTP"],
               70 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","ENTP"],
               55 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
              },
    "INTP" => {85 => ["ENTJ","ESTJ"],
               70 => ["INFP","ENFP","INFJ","ENFJ","INTJ","INTP","ENTP"],
               55 => ["ISFP", "ESFP", "ISTP","ESTP"],
               30 => ["ISFJ","ESFJ","ISTJ"],
              },
    "ENTP" => {85 => ["INFJ", "INTJ"],
               70 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
               55 => ["ISFP", "ESFP", "ISTP","ESTP"],
               30 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ISFP" => {85 => ["ENFJ","ESFJ","ESTJ"],
               55 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
               30 => ["ISFP", "ESFP", "ISTP","ESTP"],
               15 => ["INFP","ENFP","INFJ"],
              },
    "ESFP" => {85 => ["ISFJ","ISTJ"],
               55 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
               30 => ["ISFP", "ESFP", "ISTP","ESTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISTP" => {85 => ["ESFJ","ESTJ"],
               55 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
               30 => ["ISFP", "ESFP", "ISTP","ESTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESTP" => {85 => ["ISFJ","ISTJ"],
               55 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
               30 => ["ISFP", "ESFP", "ISTP","ESTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISFJ" => {85 => ["ESFP","ESTP"],
               70 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               55 => ["ENTJ","ISFP","ISTP"],
               30 => ["INTJ","INTP","ENTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESFJ" => {85 => ["ISFP","ISTP"],
               70 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               55 => ["ESFP","ESTP"],
               30 => ["INTJ","INTP","ENTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISTJ" => {85 => ["ESFP","ESTP"],
               70 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               55 => ["ENTJ","ISFP","ISTP"],
               30 => ["INTJ","INTP","ENTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESTJ" => {85 => ["INTP","ISFP","ISTP"],
               70 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               55 => ["ESFP","ESTP"],
               30 => ["INTJ","ENTP"],
               15 => ["INFP","ENFP","INFJ","ENFJ"],
              },
  }

  def friends
    friends = Message.where(sender: self).map { |message| message.receiver} + Message.where(receiver: self).map { |message| message.sender}
    friends.uniq
  end

  def conversation_with(friend_id)
    friend       = User.find(friend_id)
    conversation = Message.where(sender: self, receiver: friend) + Message.where(sender: friend, receiver: self)
    conversation.sort_by { |message| message.created_at }
  end

  def mbti
    self.profile_mbti.mbti
  end

  def find_all_matches
    self.matches(85) + self.matches(70) + self.matches(55) + self.matches(30) + self.matches(15)
  end

  def find_85_matches
    self.matches(85)
  end

  def find_70_matches
    self.matches(70)
  end

  def find_55_matches
    self.matches(55)
  end

  def find_30_matches
    self.matches(30)
  end

  def find_15_matches
    self.matches(15)
  end

  def tag_icon(tag_name)

  end

  def questions_not_answered
    questions = Question.all
    questions_answered = []
    answers = self.answers
    answers.each do |answer|
      questions_answered << answer.question
    end
    questions - questions_answered
  end


  def matches(pourcentage)
    mbti_matchings = MATCHING_MBTI[self.mbti][pourcentage]
    return [] if mbti_matchings.nil?

    matches = []
    users = User.where.not(id: self.id)
    mbti_matchings.each do |matching_mbti|
      matches += users.select { |user| user.mbti == matching_mbti }
    end
    return matches
  end
end
