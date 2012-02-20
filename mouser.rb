#!/usr/bin/env ruby
require 'hpricot'
require 'open-uri'

MOUSER_URL = "http://www.mouser.com/Search/Refine.aspx?Keyword="
ITEM = ARGV[0]
page = Hpricot(open(MOUSER_URL + ITEM))

puts "Mouser part : " + (page/"span#ctl00_ContentMain_lblMouserPartNum").inner_html
puts "Mftr part no: " + (page/"span#ctl00_ContentMain_lblManufacturerPartNum").inner_html 
puts "Description : " + (page/"span#ctl00_ContentMain_lblDescription").inner_html 
amount = (page/"td.PriceBreakQuantity a:not([@id$='_lnkQuote'])")
price = (page/"td.PriceBreakPrice span")
amount.each_with_index do |amt, i|
  puts amt.inner_html + ": " + price[i].inner_html
end
