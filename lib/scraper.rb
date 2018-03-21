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

  body_parts.each do |element|
    element.each_value{|value| puts value}
    binding.pry
  end





end
