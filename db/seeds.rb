puts 'Cleaning up database...'
KinderGarten.destroy_all
puts 'Database cleaned'
puts 'Creating new kitas...'
KinderGarten.create(name: 'casa dei bambini', address: 'Grabensprung 51, 12683, Biesdorf', email: 'bambini@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Bilingual Deutsch-Italian')
KinderGarten.create(name: 'Erlebniswelt', address: 'Sewanstr. 197 -199, 10319, Friedrichsfelde', email: 'erlebniswelt@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Nature')
KinderGarten.create(name: 'Mosaik', address: 'Donaustr. 88, 12043, Neukölln', email: 'mosaik@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Situational Approach')
KinderGarten.create(name: 'Naseweis', address: 'Waldheimer Str. 18 -20, 12627, Hellersdorf', email: 'naseweis@mykita.de', phone_number: '+491794811825', pedagogical_focus: 'Montessori')
