require "csv"

puts 'Cleaning up database...'
Bookmark.destroy_all
KinderGarten.destroy_all
Template.destroy_all
Profile.destroy_all
User.destroy_all
puts 'Database cleaned'

puts 'Creating new kitas...'
puts "parsing fakes..."
kita = KinderGarten.create(name: 'casa dei bambini', address: 'Grabensprung 51, 12683, Biesdorf', email: 'bambini@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Bilingual Deutsch-Italian')
puts "#{kita.name} created"
puts "Parsing csv file..."

# filepath = "db/kitas.csv"
filepath = "db/small-kitas.csv" # For smaller seeds tests


CSV.foreach(filepath, headers: :first_row) do |row|
  new_kita = KinderGarten.new(name: row['name'],
                      address: "#{row['street']}, #{row['house_number']}, #{row['zip']} #{row['city']}",
                      email: row['email'],
                      phone_number: row['phone_number'],
                      website: row['website'],
                      pedagogical_focus: row['pedagogical_focus'],
                      thematic_focus: row['thematic_focus'],
                      total_places: row['total_places'],
                      places_under_3: row['places_under_3'],
                      opening_time: row['opening_time'],
                      closing_time: row['closing_time'],
                      image_url: row['image_url'])

    new_kita.suburb = Geocoder.search(new_kita.address).first.data["address"]["suburb"]
    new_kita.save
  puts "#{new_kita.name}, located at #{new_kita.suburb} was created"
end
# KinderGarten.create(name: 'Erlebniswelt', address: 'Sewanstr. 197 -199, 10319, Friedrichsfelde', email: 'erlebniswelt@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Nature')
# KinderGarten.create(name: 'Mosaik', address: 'Donaustr. 88, 12043, Neukölln', email: 'mosaik@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Situational Approach')
# KinderGarten.create(name: 'Naseweis', address: 'Waldheimer Str. 18 -20, 12627, Hellersdorf', email: 'naseweis@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Montessori')

puts 'Creating new template...'
Template.create(title: "Lorem ipsum", content: "Lorem ipsum dolor s
  it amet, consectetur adipiscing elit. Nulla ac nibh a enim placerat aliquam ac non a
  nte. Phasellus at turpis eu neque dictum vestibulum a id lorem. Vestibulum ac dignis
  sim sapien, vel dignissim eros. Etiam vel dolor a tellus luctus condimentum mollis u
  t nisi. Donec mollis, lorem nec accumsan rutrum, lorem dui tempus ipsum, in vulputat
  e odio dolor ac nisi. Aenean facilisis enim dui, vitae tempor risus volutpat nec. Cr
  as tincidunt velit ut interdum egestas.")

puts 'Creating new users...'
user = User.create(email: "ladygaga@gmail.com", password: "123456")
User.create(email: "beyonce@gmail.com", password: "123456")
User.create(email: "mariah@gmail.com", password: "123456")
User.create(email: "ariana@gmail.com", password: "123456")

puts 'Creating new profiles...'
User.all.each { |user| user.create_profile }

puts 'Creating bookmarks...'
Bookmark.create!(status: "To do",
                comment: "Still have to email the Kita",
                user: user,
                kinder_garten: kita)
