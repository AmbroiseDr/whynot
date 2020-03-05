# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ProfileMbti.destroy_all
Answer.destroy_all
Question.destroy_all
User.destroy_all

ProfileMbti.create(mbti: "INTJ", description: "Conçoit des solutions innovantes pour répondre à des problèmes complexes")
ProfileMbti.create(mbti: "INTP", description: "Réfléchie de façon stratégique et capable d’élaborer des modèles conceptuels pour comprendre les problèmes complexes")
ProfileMbti.create(mbti: "ENTJ", description: "Perçoit les choses dans leur ensemble et sont des visionnaires stratégiques")
ProfileMbti.create(mbti: "ENTP", description: "Résoud les problèmes de façon créative et est souvent novateur dans sa manière de penser")
ProfileMbti.create(mbti: "INFJ", description: "Aime trouver un objectif commun pour tous et inspirer les autres")
ProfileMbti.create(mbti: "INFP", description: "Aime concevoir des solutions créatives pour résoudre les problèmes et s'engager moralement pour ce qu'il estiment être juste")
ProfileMbti.create(mbti: "ENFJ", description: "Doué pour établir un consensus et meneur charismatique")
ProfileMbti.create(mbti: "ENFP", description: "Envisage presque n’importe quelle possibilité et trouve souvent plusieurs solutions à un problème")
ProfileMbti.create(mbti: "ISTJ", description: "Digne de confiance et systématique, aime définir clairement les choses")
ProfileMbti.create(mbti: "ISFJ", description: "Fait preuve de bon sens et tire parti de son expérience pour résoudre les problèmes des autres")
ProfileMbti.create(mbti: "ESTJ", description: "Dispose d’un vaste réseau de contacts et est prêt à prendre des décisions difficiles lorsque cela est nécessaire")
ProfileMbti.create(mbti: "ESFJ", description: "Sociable et ouvert, comprend ce dont les autres ont besoin")
ProfileMbti.create(mbti: "ISTP", description: "Aime apprendre et se perfectionner pour mettre en pratique ses compétences")
ProfileMbti.create(mbti: "ISFP", description: "Aime réunir les gens, faciliter et encourager leur coopération")
ProfileMbti.create(mbti: "ESTP", description: "Sait motiver les autres en apportant de l'énergie. Fait preuve de bon sens pour affronter les problèmes")
ProfileMbti.create(mbti: "ESFP", description: "D’un naturel adaptable, convivial et bavard. Profite de la vie et aime être entouré")

puts "Profiles MBTI created"

Question.create(content: "Je suis capable de faire croire que j'ai le coronavirus pour rester chez moi", type_question: "smileys", letter_position: 1)
Question.create(content: "Je préfère parler par message pour ne pas subir l'haleine des autres", type_question:"pouce", letter_position: 1)

Question.create(content: "Lorsque je visite une ville, je m'oriente les yeux fermés", type_question:"jauge", letter_position: 2)
Question.create(content: "Aucune fake news ne peut m'avoir", type_question:"pouce", letter_position: 2)


Question.create(content: "Je dis minimum 2 fois par jour 't'inquiète'", type_question:"pouce", letter_position: 3)
Question.create(content: "Vous savez, moi je ne crois pas qu’il y ait de bonne ou de mauvaise situation. Moi, si je devais résumer ma vie aujourd’hui avec vous, je dirais que c’est d’abord des rencontres...", type_question:"smileys", letter_position: 3)

Question.create(content: "Je fais le ménage seulement quand la situation devient mortelle", type_question:"pouce", letter_position: 4)
Question.create(content: "Une semaine sans voir des amis, c'est possible ?", type_question:"jauge", letter_position: 4)

puts "Questions created"

user = User.new(email:"dan@edhec.com", password: "azerty" , name: "Dan", description:"Jovial et amical", job:"Etudiant à l'Edhec", age:23, sex: "M", song:"Feeling good - Nina Simone")
user.profile_mbti = ProfileMbti.where(mbti: "ENTP").take
user.save

user = User.new(email:"ambroise@edhec.com", password: "azerty", name: "Ambroise", description:"Sympa et exigeant", job:"Investment Analyst chez Xange", age:23, sex: "M", song:"Let it be - Beatles")
user.profile_mbti = ProfileMbti.where(mbti: "ENTJ").take
user.save

user = User.new(email:"pauline@gm.com",password: "azerty",  name: "Pauline", description:"Entrepreneure", job:"Startuppeuse chez Le Wagon", age:23, sex: "F", song:"Hurricane - Bob Dylan")
user.profile_mbti = ProfileMbti.where(mbti: "ISFJ").take
user.save

user = User.new(email:"syb@edhec.com", password: "azerty", name: "Sybile", description:"Ecologiste et philanthrope", job:"Humanitaire chez Oxfam", age:23, sex: "F", song:"Zazie")
user.profile_mbti = ProfileMbti.where(mbti: "INFJ").take
user.save

user = User.new(email:"gae@live.com", password: "azerty", name: "Gaetan", description:"Artiste et curieux", job:"Freelance en Web", age:23, sex: "M", song:"B2OBA - Booba")
user.profile_mbti = ProfileMbti.where(mbti: "ESFJ").take
user.save

user = User.new(email:"whynot@edc.com", password: "azerty", name: "Tom", description:"Passionné de Football", job:"Educateur sportif au lycée Faidherbe", age:23, sex: "M", song:"Zidane il va marquer")
user.profile_mbti = ProfileMbti.where(mbti: "ESFP").take
user.save

user = User.new(email:"okkk@edhec.com", password: "azerty", name: "Rose", description:"Cuisine et voyages !", job:"Controleuse de gestion chez Lactalis", age:25, sex: "F", song:"Kanye west")
user.profile_mbti = ProfileMbti.where(mbti: "INTJ").take
user.save

user = User.new(email:"loulou@edhec.com", password: "azerty", name: "Louis", description:"Nature et découvertes", job:"Cascadeur chez TPMP production", age:28, sex: "M", song:"YMCA")
user.profile_mbti = ProfileMbti.where(mbti: "ESTP").take
user.save

puts "Users created"
