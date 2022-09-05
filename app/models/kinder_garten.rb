class KinderGarten < ApplicationRecord
  has_many :bookmarks
  validates :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  BOROUGH = ['Charlottenburg-Wilmersdorf',
             'Friedrichshain-Kreuzberg',
             'Lichtenberg',
             'Marzahn-Hellersdorf',
             'Mitte',
             'Neukölln',
             'Pankow',
             'Reinickendorf',
             'Spandau',
             'Steglitz-Zehlendorf',
             'Tempelhof-Schöneberg',
             'Treptow-Köpenick']
end
