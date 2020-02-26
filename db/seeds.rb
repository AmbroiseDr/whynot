# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ProfileMbti.destroy_all

ProfileMbti.create(mbti: "INTJ", description: "Imaginative et penseuse stratégique, avec un plan pour tout")
ProfileMbti.create(mbti: "INTP", description: "")
ProfileMbti.create(mbti: "ENTJ", description: "")
ProfileMbti.create(mbti: "ENTP", description: "")
ProfileMbti.create(mbti: "INFJ", description: "")
ProfileMbti.create(mbti: "INFP", description: "")
ProfileMbti.create(mbti: "ENFJ", description: "")
ProfileMbti.create(mbti: "ENFP", description: "")
ProfileMbti.create(mbti: "ISTJ", description: "")
ProfileMbti.create(mbti: "ISFJ", description: "")
ProfileMbti.create(mbti: "ESTJ", description: "Dignes de confiance et systématique, aime définir clairement les choses.")
ProfileMbti.create(mbti: "ESFJ", description: "")
ProfileMbti.create(mbti: "ISTP", description: "")
ProfileMbti.create(mbti: "ISFP", description: "")
ProfileMbti.create(mbti: "ESTP", description: "")
ProfileMbti.create(mbti: "ESFP", description: "")

