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
puts "Parsing csv file..."

# filepath = "db/kitas.csv"
filepath = "db/kitas.csv" # For smaller seeds tests

def translatee(string)
  string = string.gsub!("Offene-Arbeit", "Open Work") if string.include?("Offene-Arbeit")
  string = string.gsub!("Early Excellence-Ansatz", "Early Excellence-Approach") if string.include?("Early Excellence-Ansatz")
  string = string.gsub!("Ästhetische Bildung (Musik und Kunst)", "Music and Art") if string.include?("Ästhetische Bildung (Musik und Kunst)")
  string = string.gsub!("Situationsansatz", "Situational Approach") if string.include?("Situationsansatz")
  string = string.gsub!("Waldorfpädgogik", "Waldorf Pedagogy") if string.include?("Waldorfpädgogik")
  string = string.gsub!("Ansatz von Emmi Pikler", "Emmi Pikler Approach") if string.include?("Ansatz von Emmi Pikler")
  string = string.gsub!("Montessori-Pädagogik", "Montessori") if string.include?("Montessori-Pädagogik")
  string = string.gsub!("EEC-Ansatz", "EEC Approach") if string.include?("EEC-Ansatz")
  string = string.gsub!("altagsintegrierte Sprachbildung", "Language Education") if string.include?("altagsintegrierte Sprachbildung")
  string = string.gsub!("Tiergestützte Pädagogik", "Animal Assisted Pedagogy") if string.include?("Tiergestützte Pädagogik")
  string = string.gsub!("Körper und Bewegung", "Body and Movement") if string.include?("Körper und Bewegung")
  string = string.gsub!("Natur- und Umweltpädagogik", "Nature and Environmental Education") if string.include?("Natur- und Umweltpädagogik")
  string = string.gsub!("Gesundheit", "Health") if string.include?("Gesundheit")
  string = string.gsub!("gewaltfreie Kommunikation", "Non-violent communication") if string.include?("gewaltfreie Kommunikation")
  string = string.gsub!("Altermischung", "Age mix") if string.include?("Altermischung")
  string = string.gsub!("Reggio-Pädagogik", "Reggio Pedagogy") if string.include?("Reggio-Pädagogik")
  string = string.gsub!("Demokratiepädagogik", "Democracy Pedagogy") if string.include?("Demokratiepädagogik")
  string = string.gsub!("Lebensansatz", "Life Approach") if string.include?("Lebensansatz")
  string = string.gsub!("Freinet-Pädagogik", "Freinet Pedagogy") if string.include?("Freinet-Pädagogik")
  string = string.gsub!("Krippe", "Day Nursery") if string.include?("Krippe")
  string = string.gsub!("Gestaltpädagogik", "Gestalt Pedagogy") if string.include?("Gestaltpädagogik")
  string = string.gsub!("Nachhaltigkeit und Bewegung", "Sustainability and movement") if string.include?("Nachhaltigkeit und Bewegung")
  string = string.gsub!("Interkulturelle Pädagogik", "Intercultural Pedagogy") if string.include?("Interkulturelle Pädagogik")
  string = string.gsub!("eigenes Konzept", "Own Concept") if string.include?("eigenes Konzept")
  string = string.gsub!("Halboffenes Arbeit", "Semi Open Work") if string.include?("Halboffenes Arbeit")
  string = string.gsub!("Religionspädagogik", "Religious Education") if string.include?("Religionspädagogik")
  string = string.gsub!(" Stärkung der Kompetenzen und des Selbstwertgefühls", "Strengthening of competences and self-esteem") if string.include?(" Stärkung der Kompetenzen und des Selbstwertgefühls")
  string = string.gsub!("Integration von Kindern mit Behinderung", "Integration Different-Abled Children") if string.include?("Integration von Kindern mit Behinderung")
  string = string.gsub!("Sprache", "Language") if string.include?("Sprache")
  string = string.gsub!("Naturwissenschaftliche Grunderfahrung", "Basic Science Experience") if string.include?("Naturwissenschaftliche Grunderfahrung")
  string = string.gsub!("Theaterpädagogik", "Theater Pedagogy") if string.include?("Theaterpädagogik")
  string = string.gsub!("Berliner Bildungsprogramm", "Berlin Education Program") if string.include?("Berliner Bildungsprogramm")
  string = string.gsub!("Sprachförderung", "Language Support") if string.include?("Sprachförderung")
  string = string.gsub!("frühkindliche Bildung", "Early Childhood Education") if string.include?("frühkindliche Bildung")
  string = "" if string.empty?
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

  if new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Ästhetische Bildung (Musik und Kunst)") || new_kita.thematic_focus.include?("Ästhetische Bildung (Musik und Kunst)")
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/music#{rand(3)}.jpg")
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Natur- und Umweltpädagogik") || new_kita.thematic_focus.include?("Natur- und Umweltpädagogik")
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/nature#{rand(3)}.jpg")
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Gesundheit") || new_kita.thematic_focus.include?("Gesundheit")
    new_kita.image_url = ActionController::Base.helpers.image_path('photos/health.jpg')
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Montessori-Pädagogik")
    new_kita.image_url = ActionController::Base.helpers.image_path('photos/girls.jpg')
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Körper und Bewegung") || new_kita.thematic_focus.include?("Körper und Bewegung")
    new_kita.image_url = ActionController::Base.helpers.image_path('photos/mouvement.jpg')
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Offene-Arbeit")
    new_kita.image_url = ActionController::Base.helpers.image_path('photos/group.jpg')
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("EEC-Ansatz") || new_kita.pedagogical_focus.include?("Early Excellence-Ansatz") || new_kita.pedagogical_focus.include?("EEC (Early Excellence)")
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/counting.jpg")
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Sprache") || new_kita.pedagogical_focus.include?("altagsintegrierte Sprachbildung")
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/language.jpg")
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Integration von Kindern mit Behinderung") || new_kita.thematic_focus.include?("Integration von Kindern mit Behinderung")
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/dis.jpg")
  elsif new_kita.image_url == "https://kita-navigator.berlin.de/fallback_einrichtung.jpg" && new_kita.pedagogical_focus.include?("Situationsansatz") || new_kita.pedagogical_focus.empty?
    new_kita.image_url = ActionController::Base.helpers.image_path("photos/craft#{rand(1..5)}.jpg")
  else
    new_kita.image_url
  end
  new_kita.pedagogical_focus = translatee(new_kita.pedagogical_focus)
  # Need to run the method as many times as there are words in the string
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
