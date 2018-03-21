require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  html = open('https://www.bodybuilding.com/exercises')
  doc = Nokogiri::HTML(html)
  list = doc.css('.exercise-list li')
  body_parts = []
  links = doc.css('.exercise-list li a')

  list.each do |element|
    hash = {}
    part = element.text
    hash[:body_part] = part
    hash[:url] = 'https://www.bodybuilding.com' + element.css('a')[0]['href']
    body_parts << hash
end

  i = 1
  body_parts.each do |element|
    puts element[:body_part]
    i += 1

  end
  puts body_parts





end
