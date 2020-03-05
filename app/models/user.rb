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
    'escapes'  => 'Escape game',

  }

  ICONS = {
    'sport'   => 'fa-football-ball',
    'cooking' => 'fa-utensils',
    'museum'  => 'fa-paint-brush',
    'music'   => 'fa-music',
    'walk'    =>  'fa-tree',
    'cofee'   => 'fa-coffee',
    'game'    => 'fa-chess-knight',
    'escapes'  => 'fa-search',
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
  validates :age, presence: true
  validates :name, presence: true

  MATCHING_MBTI = {
    "INFP" => {95 => ["ENFJ","ENTJ"],
               80 => ["INFP","ENFP","INFJ","INTJ","INTP","ENTP"],
               25 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
              },
    "ENFP" => {95 => ["INFJ", "INTJ"],
               80 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
               25 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "INFJ" => {95 => ["ENFP","ENTP"],
               80 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
               25 => ["ISFP", "ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ENFJ" => {95 => ["INFP","ISFP"],
               80 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","INTP","ENTP"],
               25 => ["ESFP", "ISTP","ESTP","ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "INTJ" => {95 => ["ENFP","ENTP"],
               80 => ["INFP","INFJ","ENFJ","INTJ","ENTJ","INTP"],
               65 => ["ISFP", "ESFP", "ISTP","ESTP"],
               40 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ENTJ" => {95 => ["INFP","INTP"],
               80 => ["ENFP","INFJ","ENFJ","INTJ","ENTJ","ENTP"],
               65 => ["ISFP","ESFP","ISTP","ESTP","ISFJ","EFSJ","ISTJ","ESTJ"],
              },
    "INTP" => {95 => ["ENTJ","ESTJ"],
               80 => ["INFP","ENFP","INFJ","ENFJ","INTJ","INTP","ENTP"],
               65 => ["ISFP", "ESFP", "ISTP","ESTP"],
               40 => ["ISFJ","ESFJ","ISTJ"],
              },
    "ENTP" => {95 => ["INFJ", "INTJ"],
               80 => ["INFP","ENPF","ENFJ","ENTJ","INTP","ENTP"],
               65 => ["ISFP", "ESFP", "ISTP","ESTP"],
               40 => ["ISFJ","ESFJ","ISTJ","ESTJ"],
              },
    "ISFP" => {95 => ["ENFJ","ESFJ","ESTJ"],
               65 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
               40 => ["ISFP", "ESFP", "ISTP","ESTP"],
               25 => ["INFP","ENFP","INFJ"],
              },
    "ESFP" => {95 => ["ISFJ","ISTJ"],
               65 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
               40 => ["ISFP", "ESFP", "ISTP","ESTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISTP" => {95 => ["ESFJ","ESTJ"],
               65 => ["INTJ", "ENTJ","INTP","ENTP","ISFJ","ISTJ"],
               40 => ["ISFP", "ESFP", "ISTP","ESTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESTP" => {95 => ["ISFJ","ISTJ"],
               65 => ["INTJ", "ENTJ","INTP","ENTP","ESFJ","ESTJ"],
               40 => ["ISFP", "ESFP", "ISTP","ESTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISFJ" => {95 => ["ESFP","ESTP"],
               80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               65 => ["ENTJ","ISFP","ISTP"],
               40 => ["INTJ","INTP","ENTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESFJ" => {95 => ["ISFP","ISTP"],
               80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               65 => ["ESFP","ESTP"],
               40 => ["INTJ","INTP","ENTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ISTJ" => {95 => ["ESFP","ESTP"],
               80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               65 => ["ENTJ","ISFP","ISTP"],
               40 => ["INTJ","INTP","ENTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
              },
    "ESTJ" => {95 => ["INTP","ISFP","ISTP"],
               80 => ["ISFJ","EFSJ","ISTJ","ESTJ"],
               65 => ["ESFP","ESTP"],
               40 => ["INTJ","ENTP"],
               25 => ["INFP","ENFP","INFJ","ENFJ"],
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

  def messages_unviewed
    Message.where(receiver:self, viewed: false).count
  end

  def mbti
    self.profile_mbti.mbti
  end

  def find_all_matches
    self.matches(95) + self.matches(80) + self.matches(65) + self.matches(40) + self.matches(25)
  end

  def find_95_matches
    self.matches(95)
  end

  def find_80_matches
    self.matches(80)
  end

  def find_65_matches
    self.matches(65)
  end

  def find_40_matches
    self.matches(40)
  end

  def find_25_matches
    self.matches(25)
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

  def answered!
    self.answered = true
    self.save
  end
end
