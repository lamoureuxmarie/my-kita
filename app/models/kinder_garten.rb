class KinderGarten < ApplicationRecord
  has_many :bookmarks
  has_many :ratings
  validates :name, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_address,
    against: [ :name, :address, :phone_number, :email, :pedagogical_focus, :thematic_focus ],
    using: {
      tsearch: { prefix: true }
    }
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
