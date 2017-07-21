require 'nokogiri'
require 'open-uri'
require 'rest-client'

doc = Nokogiri::HTML(open("https://scottduane.github.io/TopSecretClue/"))
