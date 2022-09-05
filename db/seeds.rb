require "csv"
require "pry"

puts 'Cleaning up database...'
Reminder.destroy_all
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
filepath = "db/kitas.csv" # For smaller seeds tests

def translatee(string)
  if string.include?("Offene-Arbeit")
    string = string.gsub!("Offene-Arbeit", "Open Work")
  elsif string.include?("Early Excellence-Ansatz")
    string = string.gsub!("Early Excellence-Ansatz", "Early Excellence-Approach")
  elsif string.include?("Situationsansatz")
    string = string.gsub!("Situationsansatz", "Situational Approach")
  elsif string.include?("Waldorfpädgogik")
    string = string.gsub!("Waldorfpädgogik", "Waldorf Pedagogy")
  elsif string.include?("Ansatz von Emmi Pikler")
    string = string.gsub!("Ansatz von Emmi Pikler", "Emmi Pikler Approach")
  elsif string.include?("Montessori-Pädagogik")
    string = string.gsub!("Montessori-Pädagogik", "Montessori")
  elsif string.include?("EEC-Ansatz")
    string = string.gsub!("EEC-Ansatz", "EEC Approach")
  elsif string.include?("altagsintegrierte Sprachbildung")
    string = string.gsub!("altagsintegrierte Sprachbildung", "Language Education")
  elsif string.include?("Tiergestützte Pädagogik")
    string = string.gsub!("Tiergestützte Pädagogik", "Animal Assisted Pedagogy")
  elsif string.include?("Körper und Bewegung")
    string = string.gsub!("Körper und Bewegung", "Body and Movement")
  elsif string.include?("Natur- und Umweltpädagogik")
    string = string.gsub!("Natur- und Umweltpädagogik", "Nature and Environmental Education")
  elsif string.include?("Gesundheit")
    string = string.gsub!("Gesundheit", "Health")
  elsif string.include?("gewaltfreie Kommunikation")
    string = string.gsub!("gewaltfreie Kommunikation", "Non-violent communication")
  elsif string.include?("Altermischung")
    string = string.gsub!("Altermischung", "Age mix")
  elsif string.include?("Reggio-Pädagogik")
    string = string.gsub!("Reggio-Pädagogik", "Reggio Pedagogy")
  elsif string.include?("Demokratiepädagogik")
    string = string.gsub!("Demokratiepädagogik", "Democracy Pedagogy")
  elsif string.include?("Ästhetische Bildung (Musik und Kunst)")
    string = string.gsub!("Ästhetische Bildung", "Music and Art")
  elsif string.include?("Lebensansatz")
    string = string.gsub!("Lebensansatz", "Life Approach")
  elsif string.include?("Freinet-Pädagogik")
    string = string.gsub!("Freinet-Pädagogik", "Freinet Pedagogy")
  elsif string.include?("Krippe")
    string = string.gsub!("Krippe", "Day Nursery")
  elsif string.include?("Gestaltpädagogik")
    string = string.gsub!("Gestaltpädagogik", "Gestalt Pedagogy")
  elsif string.include?("Nachhaltigkeit und Bewegung")
    string = string.gsub!("Nachhaltigkeit und Bewegung", "Sustainability and movement")
  elsif string.include?("Interkulturelle Pädagogik")
    string = string.gsub!("Interkulturelle Pädagogik", "Intercultural Pedagogy")
  elsif string.include?("eigenes Konzept")
    string = string.gsub!("eigenes Konzept", "Own Concept")
  elsif string.include?("Halboffenes Arbeit")
    string = string.gsub!("Halboffenes Arbeit", "Semi Open Work")
  elsif string.include?("Religionspädagogik")
    string = string.gsub!("Religionspädagogik", "Religious Education")
  elsif string.include?(" Stärkung der Kompetenzen und des Selbstwertgefühls")
    string = string.gsub!(" Stärkung der Kompetenzen und des Selbstwertgefühls", "Strengthening of competences and self-esteem")
  elsif string.include?("Integration von Kindern mit Behinderung")
    string = string.gsub!("Integration von Kindern mit Behinderung", "Integration Different-Abled Children")
  elsif string.include?("Sprache")
    string = string.gsub!("Sprache", "Language")
  elsif string.include?("Naturwissenschaftliche Grunderfahrung")
    string = string.gsub!("Naturwissenschaftliche Grunderfahrung", "Basic Science Experience")
  elsif string.include?("Theaterpädagogik")
    string = string.gsub!("Theaterpädagogik", "Theater Pedagogy")
  elsif string.include?("Berliner Bildungsprogramm")
    string = string.gsub!("Berliner Bildungsprogramm", "Berlin Education Program")
  elsif string.include?("Sprachförderung")
    string = string.gsub!("Sprachförderung", "Language Support")
  elsif string.include?("frühkindliche Bildung")
    string = string.gsub!("frühkindliche Bildung", "Early Childhood Education")
  elsif string.empty?
    ""
  end
  string
end

CSV.foreach(filepath, headers: :first_row) do |row|
  new_kita = KinderGarten.new(name: row['name'],
                              address: "#{row['street']}, #{row['house_number']}, #{row['zip']} #{row['city']}",
                              email: row['email'],
                              phone_number: row['phone_number'],
                              website: row['website'],
                              pedagogical_focus: JSON.parse(row['pedagogical_focus'] || [""]).join(", "),
                              thematic_focus: JSON.parse(row['thematic_focus'] || [""]).join(", "),
                              total_places: row['total_places'],
                              places_under_3: row['places_under_3'],
                              opening_time: row['opening_time'],
                              closing_time: row['closing_time'],
                              image_url: row['image_url'])

  new_kita.pedagogical_focus = translatee(new_kita.pedagogical_focus)
  new_kita.thematic_focus = translatee(new_kita.thematic_focus)
  new_kita.borough = Geocoder.search(new_kita.address).first.data["address"]["borough"]
  new_kita.save!
  puts "#{new_kita.name}, located at #{new_kita.borough} was created"
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

# puts 'Creating bookmarks...'
# Bookmark.create!(status: "To do",
#                 comment: "Still have to email the Kita",
#                 user: user,
#                 kinder_garten: kita)
