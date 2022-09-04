require "csv"

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

def translate(string)
  case string
  when string.include?("Offene-Arbeit")
    string.gsub!("Offene-Arbeit", "Open Work")
  when string.include?("Early Excellence-Ansatz")
    string.gsub!("Early Excellence-Ansatz", "Early Excellence-Approach")
  when string.include?("Situationsansatz")
    string.gsub!("Situationsansatz", "Situational Approach")
  when string.include?("Waldorfpädgogik")
    string.gsub!("Waldorfpädgogik", "Waldorf Pedagogy")
  when string.include?("Ansatz von Emmi Pikler")
    string.gsub!("Ansatz von Emmi Pikler", "Emmi Pikler Approach")
  when string.include?("Montessori-Pädagogik")
    string.gsub!("Montessori-Pädagogik", "Montessori")
  when string.include?("EEC-Ansatz")
    string.gsub!("EEC-Ansatz", "EEC Approach")
  when string.include?("altagsintegrierte Sprachbildung")
    string.gsub!("altagsintegrierte Sprachbildung", "Language Education")
  when string.include?("Tiergestützte Pädagogik")
    string.gsub!("Tiergestützte Pädagogik", "Animal Assisted Pedagogy")
  when string.include?("Körper und Bewegung")
    string.gsub!("Körper und Bewegung", "Body and Movement")
  when string.include?("Natur- und Umweltpädagogik")
    string.gsub!("Natur- und Umweltpädagogik", "Nature and Environmental Education")
  when string.include?("Gesundheit")
    string.gsub!("Gesundheit", "Health")
  when string.include?("gewaltfreie Kommunikation")
    string.gsub!("gewaltfreie Kommunikation", "Non-violent communication")
  when string.include?("Altermischung")
    string.gsub!("Altermischung", "Age mix")
  when string.include?("Reggio-Pädagogik")
    string.gsub!("Reggio-Pädagogik", "Reggio Pedagogy")
  when string.include?("Demokratiepädagogik")
    string.gsub!("Demokratiepädagogik", "Democracy Pedagogy")
  when string.include?("Ästhetische Bildung (Musik und Kunst)")
    string.gsub!("Ästhetische Bildung", "Music and Art")
  when string.include?("Lebensansatz")
    string.gsub!("Lebensansatz", "Life Approach")
  when string.include?("Freinet-Pädagogik")
    string.gsub!("Freinet-Pädagogik", "Freinet Pedagogy")
  when string.include?("Krippe")
    string.gsub!("Krippe", "Day Nursery")
  when string.include?("Gestaltpädagogik")
    string.gsub!("Gestaltpädagogik", "Gestalt Pedagogy")
  when string.include?("Nachhaltigkeit und Bewegung")
    string.gsub!("Nachhaltigkeit und Bewegung", "Sustainability and movement")
  when string.include?("Interkulturelle Pädagogik")
    string.gsub!("Interkulturelle Pädagogik", "Intercultural Pedagogy")
  when string.include?("eigenes Konzept")
    string.gsub!("eigenes Konzept", "Own Concept")
  when string.include?("Halboffenes Arbeit")
    string.gsub!("Halboffenes Arbeit", "Semi Open Work")
  when string.include?("Religionspädagogik")
    string.gsub!("Religionspädagogik", "Religious Education")
  when string.include?(" Stärkung der Kompetenzen und des Selbstwertgefühls")
    string.gsub!(" Stärkung der Kompetenzen und des Selbstwertgefühls", "Strengthening of competences and self-esteem")
  when string.include?("Integration von Kindern mit Behinderung")
    string.gsub!("Integration von Kindern mit Behinderung", "Integration Different-Abled Children")
  when string.include?("Sprache")
    string.gsub!("Sprache", "Language")
  when string.include?("Naturwissenschaftliche Grunderfahrung")
    string.gsub!("Naturwissenschaftliche Grunderfahrung", "Basic Science Experience")
  when string.include?("Theaterpädagogik")
    string.gsub!("Theaterpädagogik", "Theater Pedagogy")
  when string.include?("Berliner Bildungsprogramm")
    string.gsub!("Berliner Bildungsprogramm", "Berlin Education Program")
  when string.include?("Sprachförderung")
    string.gsub!("Sprachförderung", "Language Support")
  when string.include?("frühkindliche Bildung")
    string.gsub!("frühkindliche Bildung", "Early Childhood Education")
  end
end

CSV.foreach(filepath, headers: :first_row) do |row|
  new_kita = KinderGarten.new(name: row['name'],
                              address: "#{row['street']}, #{row['house_number']}, #{row['zip']} #{row['city']}",
                              email: row['email'],
                              phone_number: row['phone_number'],
                              website: row['website'],
                              pedagogical_focus: row['pedagogical_focus'].tr('[]', '').tr('""', ''),
                              thematic_focus: row['thematic_focus'].tr('[]', '').tr('""', ''),
                              total_places: row['total_places'],
                              places_under_3: row['places_under_3'],
                              opening_time: row['opening_time'],
                              closing_time: row['closing_time'],
                              image_url: row['image_url'])

  new_kita.borough = Geocoder.search(new_kita.address).first.data["address"]["borough"]
  new_kita.save
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
