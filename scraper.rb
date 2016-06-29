require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.dslr-forum.de/forumdisplay.php?f=109&order=desc&page=1"))   
