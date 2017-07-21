require 'nokogiri'
require 'open-uri'
require 'rest-client'

doc = Nokogiri::HTML(open("https://scottduane.github.io/TopSecretClue/"))

links = doc.css('a')
hrefs = links.map { |link| link.attribute('href').to_s }

p hrefs

valid_links = []
hrefs.each do |href|
  puts href
  begin
    response = RestClient.get href
    if response.code == 200
      valid_links << href
      puts "FOUND A VALID LINK"
    end
  rescue
    next
  end
end
