#!/usr/bin/env ruby
require 'hpricot'
require 'open-uri'

DIGIKEY_URL = "http://search.digikey.com/scripts/DkSearch/dksus.dll?Detail&name="
ITEM = ARGV[0]
page = Hpricot(open(DIGIKEY_URL + ITEM))

puts "Digikey part: " + ITEM
puts "Mftr part no: " + page.at("th[text()*='Manufacturer Part Number']").following_siblings.inner_html
puts "Description : " + page.at("th[text()*='Description']").following_siblings.inner_html 
(page/"table table table tr").each_with_index do |t, index|
  puts (t/"td:nth-child(1)").inner_html + ": " + (t/"td:nth-child(2)").inner_html unless index == 0
end
