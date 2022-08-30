require "open-uri"
require "nokogiri"

class GartenScraper
  def scraper
    html = URI.open("https://kita-navigator.berlin.de/einrichtungen?input=Burgemeisterstra%C3%9Fe%2072%2C%2012103%20Berlin%2C%20Allemagne&betb=7-2022&einfacheSuche=true&entfernung=2&lat=52.457368&lon=13.3798883").read
    # Parse HTML
    doc = Nokogiri::HTML(html, nil, "utf-8")
    # Get all results
    results = []
    search = doc.search("#app")
    puts search
    # search.each do |e|
    # # Create kita and save it
    #   name = e.search(".einrichtung-list-item-name").text.strip
    #   distance = e.search(".einrichtunglistitem-distance").text.strip
    #   puts name
    #   puts distance
    # end
    return results
  end
end
