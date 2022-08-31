require "json"
require "open-uri"
require "csv"

class GartenScraper
  def fetch_ids
    url = "https://kita-navigator.berlin.de/api/v1/kitas/umkreissuche?input=&betb=7-2022&einfacheSuche=true&entfernung=50&seite=0&max=2797"
    index_serialized = URI.open(url).read
    index_data = JSON.parse(index_serialized)
    ids = []
    index_data["einrichtungen"].each do |kita|
      ids << kita["id"]
    end
    return ids
  end

  def scraper
    ids = fetch_ids
    filepath = "db/kitas.csv"
    CSV.open(filepath, "wb") do |csv|
      csv << ["id",
              "name",
              "latitude",
              "longitude",
              "street",
              "house_number",
              "zip",
              "city",
              "email",
              "phone_number",
              "website",
              "acceptance_age",
              "total_places",
              "places_under_3",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "month",
              "free_places",
              "pedagogical_focus",
              "thematic_focus",
              "image_url",
              "day",
              "opening_time",
              "closing_time",
              "day",
              "opening_time",
              "closing_time",
              "day",
              "opening_time",
              "closing_time",
              "day",
              "opening_time",
              "closing_time",
              "day",
              "opening_time",
              "closing_time"]
      ids.each do |id|
        url = "https://kita-navigator.berlin.de/api/v1/kitas/#{id}"
        kita_serialized = URI.open(url).read
        kita_data = JSON.parse(kita_serialized)
        puts kita_data["einrichtungsauszug"]['name']
        csv << [kita_data["einrichtungsauszug"]['id'],
                kita_data["einrichtungsauszug"]['name'],
                kita_data["einrichtungsauszug"]['geokoordinate']['lat'],
                kita_data["einrichtungsauszug"]['geokoordinate']['lon'],
                kita_data["einrichtungsauszug"]['adresse']['strasse'],
                kita_data["einrichtungsauszug"]['adresse']['hausnummer'],
                kita_data["einrichtungsauszug"]['adresse']['plz'],
                kita_data["einrichtungsauszug"]['adresse']['ort'],
                kita_data['kontaktdaten']['emailadresse'],
                kita_data['kontaktdaten']['telefonnummer'],
                kita_data['kontaktdaten']['webadresse'],
                kita_data['betreuung']['aufnahmealter'],
                kita_data['betreuung']['anzahlKinder'],
                kita_data['betreuung']['anzahlKinderUnter3'],
                kita_data['betreuung']['paedagogischerAnsatz'],
                kita_data['betreuung']['thematischeSchwerpunkte'],
                "https://kita-navigator.berlin.de#{kita_data['bild']['url']}",
                # kita_data['oeffnungszeiten'][0]['tag'],
                kita_data.dig('oeffnungszeiten', 0, 'tag'),
                kita_data.dig('oeffnungszeiten', 0, 'von'),
                kita_data.dig('oeffnungszeiten', 0, 'bis'),
                kita_data.dig('oeffnungszeiten', 1, 'tag'),
                kita_data.dig('oeffnungszeiten', 1, 'von'),
                kita_data.dig('oeffnungszeiten', 1, 'bis'),
                kita_data.dig('oeffnungszeiten', 2, 'tag'),
                kita_data.dig('oeffnungszeiten', 2, 'von'),
                kita_data.dig('oeffnungszeiten', 2, 'bis'),
                kita_data.dig('oeffnungszeiten', 3, 'tag'),
                kita_data.dig('oeffnungszeiten', 3, 'von'),
                kita_data.dig('oeffnungszeiten', 3, 'bis'),
                kita_data.dig('oeffnungszeiten', 4, 'tag'),
                kita_data.dig('oeffnungszeiten', 4, 'von'),
                kita_data.dig('oeffnungszeiten', 4, 'bis')]
      end
    end
  end
end
