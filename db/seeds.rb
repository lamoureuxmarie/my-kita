# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning up database...'
KinderGarten.destroy_all
Template.destroy_all
User.destroy_all
Profile.destroy_all
puts 'Database cleaned'

puts 'Creating new kitas...'
KinderGarten.create(name: 'casa dei bambini', address: 'Grabensprung 51, 12683, Biesdorf', email: 'bambini@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Bilingual Deutsch-Italian')
KinderGarten.create(name: 'Erlebniswelt', address: 'Sewanstr. 197 -199, 10319, Friedrichsfelde', email: 'erlebniswelt@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Nature')
KinderGarten.create(name: 'Mosaik', address: 'Donaustr. 88, 12043, Neukölln', email: 'mosaik@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Situational Approach')
KinderGarten.create(name: 'Naseweis', address: 'Waldheimer Str. 18 -20, 12627, Hellersdorf', email: 'naseweis@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Montessori')

puts 'Creating new template...'
Template.create(title: "Lorem ipsum", content: "Lorem ipsum dolor s
  it amet, consectetur adipiscing elit. Nulla ac nibh a enim placerat aliquam ac non a
  nte. Phasellus at turpis eu neque dictum vestibulum a id lorem. Vestibulum ac dignis
  sim sapien, vel dignissim eros. Etiam vel dolor a tellus luctus condimentum mollis u
  t nisi. Donec mollis, lorem nec accumsan rutrum, lorem dui tempus ipsum, in vulputat
  e odio dolor ac nisi. Aenean facilisis enim dui, vitae tempor risus volutpat nec. Cr
  as tincidunt velit ut interdum egestas.")

puts 'Creating new users...'
User.create(email: "ladygaga@gmail.com", password: "123456")
User.create(email: "beyonce@gmail.com", password: "123456")
User.create(email: "mariah@gmail.com", password: "123456")
User.create(email: "ariana@gmail.com", password: "123456")

puts 'Creating new profiles...'
User.all.each { |user| user.create_profile }
