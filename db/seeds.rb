# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pose_list = [
  ["Urdhva Vrikshasane", "Upward Tree Position"],
  ["Uttanasana", "Standing Forward Fold"],
  ["Ardha Uttanasana", "Half Standing Forward Fold"],
  ["Chaturanga Dandasana", "Low Plank"],
  ["Eka Pada Tadasana", "One-Legged Mountain"],
  ["Ardha Matsyendrasana", "Half Lord of the Fishes"],
  ["Bakasana", "Crow"],
  ["Astavakrasana", "Eight-Angle"],
  ["Garudasana", "Eagle"],
  ["Utthita Hasta Padangustasana", "Extended Hand-To-Big-Toe"],
  ["Ardha Chandrasana", "Half Moon"],
  ["Adho Mukha Vrksasana", "Handstand"],
  ["Vasisthasana", "Side Plank"],
  ["Salamba Sirsasana", "Supported Headstand"],
  ["Salmba Sarvangasana", "Supported Shoulderstand"],
  ["Vrksasana", "Tree"],
  ["Virachadrasana III", "Warrior III"]
]

pose_list.each do |sanskrit_name, english_name|
  Pose.create(sanskrit_name: sanskrit_name, english_name: english_name)
end
